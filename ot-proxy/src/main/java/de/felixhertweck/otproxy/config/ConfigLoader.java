package de.felixhertweck.otproxy.config;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Path;

import org.yaml.snakeyaml.LoaderOptions;
import org.yaml.snakeyaml.Yaml;
import org.yaml.snakeyaml.constructor.Constructor;
import org.yaml.snakeyaml.introspector.Property;
import org.yaml.snakeyaml.introspector.PropertyUtils;
import org.yaml.snakeyaml.nodes.Node;
import org.yaml.snakeyaml.nodes.NodeId;
import org.yaml.snakeyaml.nodes.ScalarNode;

public class ConfigLoader {

    public static ProxyConfig load(Path path) throws IOException {
        try (InputStream in = new FileInputStream(path.toFile())) {
            return load(in);
        }
    }

    public static ProxyConfig load(InputStream in) {
        LoaderOptions loaderOptions = new LoaderOptions();
        Constructor constructor = new ShorthandAwareConstructor(loaderOptions);
        constructor.setPropertyUtils(snakeCasePropertyUtils());
        Yaml yaml = new Yaml(constructor);
        return yaml.load(in);
    }

    /** Accepts {@code default_action: DENY} as shorthand for both directions. */
    private static final class ShorthandAwareConstructor extends Constructor {
        ShorthandAwareConstructor(LoaderOptions loaderOptions) {
            super(ProxyConfig.class, loaderOptions);
        }

        @Override
        protected Object constructObject(Node node) {
            if (node.getNodeId() == NodeId.scalar
                    && node.getType() == DirectionalActionConfig.class) {
                String value = ((ScalarNode) node).getValue();
                DirectionalActionConfig action = new DirectionalActionConfig();
                action.setRead(value);
                action.setWrite(value);
                return action;
            }
            return super.constructObject(node);
        }
    }

    private static PropertyUtils snakeCasePropertyUtils() {
        PropertyUtils pu =
                new PropertyUtils() {
                    @Override
                    public Property getProperty(Class<?> type, String name) {
                        return super.getProperty(type, snakeToCamel(name));
                    }
                };
        pu.setSkipMissingProperties(true);
        return pu;
    }

    private static String snakeToCamel(String name) {
        if (!name.contains("_")) return name;
        StringBuilder sb = new StringBuilder();
        boolean upper = false;
        for (char c : name.toCharArray()) {
            if (c == '_') {
                upper = true;
            } else {
                sb.append(upper ? Character.toUpperCase(c) : c);
                upper = false;
            }
        }
        return sb.toString();
    }
}
