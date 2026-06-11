package de.felixhertweck.emulator.service;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class IcdFileLoader {

    private static final Logger logger = LoggerFactory.getLogger(IcdFileLoader.class);

    /**
     * Extracts the relay.icd SCL file from the classpath to a temporary file.
     *
     * @return The absolute path to the temporary file.
     * @throws IOException If the extraction fails.
     */
    public String extractToTemp() throws IOException {
        try (InputStream is = getClass().getResourceAsStream("/relay.icd")) {
            if (is == null) {
                throw new IOException("Could not find relay.icd in classpath");
            }
            File tempFile = File.createTempFile("relay", ".icd");
            tempFile.deleteOnExit();

            Files.write(tempFile.toPath(), is.readAllBytes());

            logger.info("Extracted SCL/ICD file to {}", tempFile.getAbsolutePath());
            return tempFile.getAbsolutePath();
        }
    }
}
