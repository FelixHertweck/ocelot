package de.felixhertweck.otproxy.protocol.iec61850;

import java.nio.file.Path;
import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;

import com.beanit.iec61850bean.BasicDataAttribute;
import com.beanit.iec61850bean.BdaBoolean;
import com.beanit.iec61850bean.Fc;
import com.beanit.iec61850bean.SclParser;
import com.beanit.iec61850bean.ServerModel;
import de.felixhertweck.otproxy.core.model.WriteRequest;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

class Iec61850RequestAdapterTest {

    private static ServerModel model;
    private final Iec61850RequestAdapter adapter = new Iec61850RequestAdapter();

    @BeforeAll
    static void loadModel() throws Exception {
        String path =
                Path.of(Iec61850RequestAdapterTest.class.getResource("/test-relay.icd").toURI())
                        .toString();
        model = SclParser.parse(path).get(0);
    }

    @Test
    void mapsControlWriteToWriteRequest() {
        BdaBoolean ctlVal =
                (BdaBoolean) model.findModelNode("RelayIEDPROT/XCBR1.Pos.Oper.ctlVal", Fc.CO);
        ctlVal.setValue(false);

        Optional<WriteRequest> request = adapter.adapt(ctlVal, "10.0.0.5");

        assertThat(request).isPresent();
        assertThat(request.get().protocol()).isEqualTo("iec61850");
        assertThat(request.get().target()).isEqualTo("RelayIEDPROT/XCBR1.Pos");
        assertThat(request.get().value()).isZero();
        assertThat(request.get().sourceIp()).isEqualTo("10.0.0.5");
    }

    @Test
    void mapsTrueControlValueToOne() {
        BdaBoolean ctlVal =
                (BdaBoolean) model.findModelNode("RelayIEDPROT/XCBR1.Pos.Oper.ctlVal", Fc.CO);
        ctlVal.setValue(true);

        assertThat(adapter.adapt(ctlVal, "x").get().value()).isEqualTo(1);
    }

    @Test
    void ignoresNonControlWrites() {
        BasicDataAttribute measurement =
                (BasicDataAttribute) model.findModelNode("RelayIEDPROT/MMXU1.TotW.mag.f", Fc.MX);

        assertThat(adapter.adapt(measurement, "x")).isEmpty();
    }
}
