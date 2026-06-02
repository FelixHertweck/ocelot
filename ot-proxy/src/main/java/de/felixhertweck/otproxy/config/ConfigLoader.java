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

public class ConfigLoader {

    public static ProxyConfig load(Path path) throws IOException {
        try (InputStream in = new FileInputStream(path.toFile())) {
            return load(in);
        }
    }

    public static ProxyConfig load(InputStream in) {
        LoaderOptions loaderOptions = new LoaderOptions();
        Constructor constructor = new Constructor(ProxyConfig.class, loaderOptions);
        constructor.setPropertyUtils(snakeCasePropertyUtils());
        Yaml yaml = new Yaml(constructor);
        return yaml.load(in);
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
