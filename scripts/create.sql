CREATE DATABASE IF NOT EXISTS FACTURACION_SAMA;

-- CREATE USER 'SAMA_CONCILIA_UPLOADER'@'localhost' IDENTIFIED BY 'Pasw0rd'

-- GRANT ALL PRIVILEGES ON * . * TO 'SAMA_CONCILIA_UPLOADER'@'localhost'

-- -----------------------------------------------------
-- Tabla tb_facturas
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS FACTURACION_SAMA.tb_factura (
    ID INT NOT NULL AUTO_INCREMENT,
    FECHA_DE_AUDITORÍA DATE NOT NULL,
    DOCUMENTO CHAR(40),
    CONSECUTIVO VARCHAR(500) NOT NULL,
    NUM_FACTURA_MEDICAMENTO VARCHAR(500) NOT NULL,
    NUM_FACTURA_OL VARCHAR(500) NOT NULL,
    ESM_FACTURACION VARCHAR(500) NOT NULL,
    ESM_FACTURACION_NOMBRE VARCHAR(500),
    ESM_CODIGO VARCHAR(500) NOT NULL,
    ESM_INTERNO VARCHAR(500) NOT NULL,
    ESM_NOMBRE VARCHAR(500),
    ESM_ADSCRITO VARCHAR(500) NOT NULL,
    ESM_ADSCRITO_NOMBRE VARCHAR(500),
    FUERZA_ESM_ADSCRITO VARCHAR(500) NOT NULL,
    FUERZA_ESM_NOMBRE_ADSCRITO VARCHAR(500),
    FUERZA_ESM VARCHAR(500) NOT NULL,
    FUERZA_ESM_NOMBRE VARCHAR(500),
    TIPO_DISPENSACION VARCHAR(500),
    CODIGO_AUTORIZACION VARCHAR(500),
    DOCUMENTO_FECHA_FORMULACION VARCHAR(500) NOT NULL,
    DOCUMENTO_FECHA_TRANSACCION VARCHAR(500) NOT NULL,
    TIPO_MEDICAMENTO_NOMBRE VARCHAR(500),
    TIPO_FORMULA_NOMBRE VARCHAR(500),
    AFILIADO_CODIGO VARCHAR(500),
    AFILIADO_NOMBRE VARCHAR(500),
    FUERZA_FACTURA_NOMBRE VARCHAR(500),
    TIPO_VINCULACION_NOMBRE VARCHAR(500),
    CODIGO_MEDICAMENTO VARCHAR(500),
    CODIGO_MEDICAMENTO_HOMIC VARCHAR(500),
    DESC_MEDICAMENTO_REFERENCIA VARCHAR(500),
    DESC_MEDICAMENTO_GENERICO VARCHAR(500),
    F039_CANTIDAD_PEDIDA VARCHAR(500) NOT NULL,
    CANTIDAD_DESPACHADA VARCHAR(500) NOT NULL,
    PRECIO_UNITARIO VARCHAR(500) NOT NULL,
    VALOR_ADECUACION VARCHAR(500) NOT NULL,
    SUBTOTAL_ANTES_IVA VARCHAR(500) NOT NULL,
    VALOR_EXCLUIDO VARCHAR(500) NOT NULL,
    VALOR_GRAVADO VARCHAR(500) NOT NULL,
    VALOR_IVA VARCHAR(500) NOT NULL,
    VALOR_FACTURA_MEDICAMENTOS VARCHAR(500) NOT NULL,
    VALOR_INTERMEDIACION VARCHAR(500) NOT NULL,
    VALOR_IVA_INTERM VARCHAR(500) NOT NULL,
    VALOR_FACTURA_OL VARCHAR(500) NOT NULL,
    TOTAL VARCHAR(500) NOT NULL,
    TOTAL_REPORTADO_A_SAMA VARCHAR(500) NOT NULL,
    DIFERENCIA_ENTRE_SAMA_Y_DROSERVICIO VARCHAR(500) NOT NULL,
    LOTE VARCHAR(500),
    FECHA_VENCIMIENTO VARCHAR(500) NOT NULL,
    INVIMA VARCHAR(500),
    DOSIS VARCHAR(500) NOT NULL,
    TIEMPO_DOSIS VARCHAR(500) NOT NULL,
    CONCENTRACION VARCHAR(500),
    ESM_GENERA_FORMULA VARCHAR(500) NOT NULL,
    ESM_GENERA_FORMULA_NOMBRE VARCHAR(500),
    CIE10 VARCHAR(500),
    CIE10_NOMBRE VARCHAR(500),
    MEDICO_CODIGO VARCHAR(500) NOT NULL,
    MEDICO_NOMBRE VARCHAR(500),
    TIPO_FORMULA VARCHAR(500),
    TIRILLA VARCHAR(500) NOT NULL,
    DOCUMENTO_NUMERO_ITEM VARCHAR(500) NOT NULL,
    LABORATORIO_CODIGO VARCHAR(500) NOT NULL,
    LABORATORIO_NOMBRE VARCHAR(500),
    VR_FACTURACION VARCHAR(500) NOT NULL,
    ANTICIPO_50 VARCHAR(500) NOT NULL,
    SEGUNDO_DESEMBOLSO VARCHAR(500) NOT NULL,
    PAGO_CONCILIACION_1 VARCHAR(500) NULL,
    PAGO_CONCILIACION_2 VARCHAR(500) NULL,
    SALDO VARCHAR(500) NOT NULL,
    PRIMARY KEY (ID)
);

-- -----------------------------------------------------
-- Tabla tb_glosa
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS FACTURACION_SAMA.tb_glosa (
    ID INT NOT NULL AUTO_INCREMENT,
    FACTURA_ID INT NOT NULL,
    DESCRIPCION_GLOSA VARCHAR(500),
    VR_MEDICAMENTO VARCHAR(500),
    INTERMEDIACION VARCHAR(500),
    IVA_INTERMEDIACION VARCHAR(500),
    IVA VARCHAR(500) ,
    UNIDOSIS VARCHAR(500),
    TOTAL VARCHAR(500),
    VALOR_A_PAGAR VARCHAR(500),
    ESTADO VARCHAR(500),
    PRIMARY KEY (ID),
    FOREIGN KEY (FACTURA_ID) REFERENCES FACTURACION_SAMA.tb_factura(ID)
);

-- -----------------------------------------------------
-- Tabla tb_respuesta_opl
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS FACTURACION_SAMA.tb_respuesta_opl(
    RESPUESTA_OPL_ID INT NOT NULL AUTO_INCREMENT,
    GLOSA_ID INT NOT NULL,
    RESPUESTA_OPL VARCHAR(500),
    OBSERVACION VARCHAR(500),
    VALOR_ACEPTADO VARCHAR(500) NOT NULL,
    VALOR_NO_ACEPTADO VARCHAR(500) NOT NULL,
    PRIMARY KEY (RESPUESTA_OPL_ID),
    FOREIGN KEY (GLOSA_ID) REFERENCES FACTURACION_SAMA.tb_glosa(ID)
);

CREATE TABLE IF NOT EXISTS FACTURACION_SAMA.tb_CONCILIACION(
    CONCILIACION_ID INT NOT NULL AUTO_INCREMENT,
    GLOSA_ID INT NOT NULL,
    RESPUESTA_OPL VARCHAR(500),
    OBSERVACION VARCHAR(500),
    VALOR_ACEPTADO VARCHAR(500) NOT NULL,
    VALOR_NO_ACEPTADO VARCHAR(500) NOT NULL,
    CODIGO_GLOSA VARCHAR(500),
    VALOR_OBJETADO VARCHAR(500) NOT NULL,
    VALOR_OBJETADO_ACEPTADO_CONCILIACION VARCHAR(500) NOT NULL,
    OBSERVACION_GLOSA VARCHAR(500),
    VALOR_SOPORTADO VARCHAR(500),
    OBSERVACION_GLOSA_SOPORTADA_SAMA VARCHAR(500),
    VALOR_RATIFICADO_EN_CONCILIACION VARCHAR(500),
    OBSERVACION_GLOSA_DEFINITIVA VARCHAR(500),
    VALOR_NO_CONCILIADO_SEGUNDA_INSTANCIA VARCHAR(500),
    OBSERVACION_GLOSA_SEGUNDA_INSTANCIA VARCHAR(500),
    VALOR_SUBTOTAL_MEDICAMENTO_A_PAGAR VARCHAR(500),
    VALOR_GASTO_DE_OPL_A_PAGAR VARCHAR(500),
    VALOR_IVA_OPL_A_PAGAR VARCHAR(500),
    VALOR_IVA_DEL_MEDICAMENTO_A_PAGAR VARCHAR(500),
    VALOR_ADECUACION_A_PAGAR VARCHAR(500),
    VALOR_A_PAGAR_CONCILIADO VARCHAR(500),
    ESTADO VARCHAR(500),
    PRIMARY KEY (CONCILIACION_ID),
    FOREIGN KEY (GLOSA_ID) REFERENCES FACTURACION_SAMA.tb_glosa(ID)
);