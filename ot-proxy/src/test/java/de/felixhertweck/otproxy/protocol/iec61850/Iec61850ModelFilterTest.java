package de.felixhertweck.otproxy.protocol.iec61850;

import java.nio.file.Path;
import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;

import com.beanit.iec61850bean.LogicalDevice;
import com.beanit.iec61850bean.LogicalNode;
import com.beanit.iec61850bean.SclParser;
import com.beanit.iec61850bean.ServerModel;
import de.felixhertweck.otproxy.config.DirectionalActionConfig;
import de.felixhertweck.otproxy.config.Iec61850PointRuleConfig;
import de.felixhertweck.otproxy.config.RulesConfig;
import org.junit.jupiter.api.Test;

/** Model filtering keys off {@code default_action.read} only. */
class Iec61850ModelFilterTest {

    private static final String XCBR_POS = "RelayIEDPROT/XCBR1.Pos";

    private ServerModel parseModel() throws Exception {
        String icdPath = Path.of(getClass().getResource("/test-relay.icd").toURI()).toString();
        return SclParser.parse(icdPath).get(0);
    }

    private List<String> lnNames(ServerModel model) {
        LogicalDevice ld = (LogicalDevice) model.getChildren().iterator().next();
        return ld.getChildren().stream().map(n -> ((LogicalNode) n).getName()).toList();
    }

    private RulesConfig rulesWithReadDefault(
            String readDefault, Iec61850PointRuleConfig... objects) {
        DirectionalActionConfig defaultAction = new DirectionalActionConfig();
        defaultAction.setRead(readDefault);
        defaultAction.setWrite("DENY");

        RulesConfig rules = new RulesConfig();
        rules.setDefaultAction(defaultAction);
        rules.setObjects(List.of(objects));
        return rules;
    }

    private Iec61850PointRuleConfig allowRead(String reference) {
        Iec61850PointRuleConfig rule = new Iec61850PointRuleConfig();
        rule.setReference(reference);
        rule.setAllowRead(true);
        rule.setAllowWrite(false);
        return rule;
    }

    @Test
    void readDenyByDefaultPrunesToTheAllowReadListPlusSystemNodes() throws Exception {
        RulesConfig rules = rulesWithReadDefault("DENY", allowRead(XCBR_POS));

        ServerModel exposed = Iec61850ModelFilter.buildExposedModel(parseModel(), rules);

        assertThat(lnNames(exposed)).containsExactlyInAnyOrder("LLN0", "LPHD1", "XCBR1");
    }

    @Test
    void readAllowByDefaultExposesTheFullMirrorEvenWithoutAnyAllowReadRules() throws Exception {
        RulesConfig rules = rulesWithReadDefault("ALLOW");

        ServerModel exposed = Iec61850ModelFilter.buildExposedModel(parseModel(), rules);

        assertThat(lnNames(exposed))
                .containsExactlyInAnyOrder("LLN0", "LPHD1", "MMXU1", "XCBR1", "CSWI1");
    }

    @Test
    void readDirectionDefaultIsIndependentOfWriteDirectionDefault() throws Exception {
        DirectionalActionConfig defaultAction = new DirectionalActionConfig();
        defaultAction.setRead("ALLOW");
        defaultAction.setWrite("DENY");
        RulesConfig rules = new RulesConfig();
        rules.setDefaultAction(defaultAction);

        assertThat(rules.getDefaultReadAction()).isEqualTo("ALLOW");
        assertThat(rules.getDefaultWriteAction()).isEqualTo("DENY");

        ServerModel exposed = Iec61850ModelFilter.buildExposedModel(parseModel(), rules);
        assertThat(lnNames(exposed))
                .containsExactlyInAnyOrder("LLN0", "LPHD1", "MMXU1", "XCBR1", "CSWI1");
    }

    @Test
    void missingDefaultActionFailsSafeToReadDeny() throws Exception {
        RulesConfig rules = new RulesConfig();
        rules.setObjects(List.of(allowRead(XCBR_POS)));

        ServerModel exposed = Iec61850ModelFilter.buildExposedModel(parseModel(), rules);

        assertThat(lnNames(exposed)).containsExactlyInAnyOrder("LLN0", "LPHD1", "XCBR1");
    }
}
