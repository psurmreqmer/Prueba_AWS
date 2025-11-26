CREATE DATABASE IF NOT EXISTS estudiantes;
USE estudiantes;

-- Tablas base (sin dependencias)
CREATE TABLE estudiantes (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  edad INT,
  genero VARCHAR(20),
  nivel_socioeconomico VARCHAR(20),
  direccion VARCHAR(100),
  situacion_familiar VARCHAR(100),
  fecha_registro DATE
);

CREATE TABLE intereses (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nombre_interes VARCHAR(100),
  descripcion TEXT
);

CREATE TABLE habilidades (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nombre_habilidad VARCHAR(100),
  tipo_habilidad VARCHAR(50),
  descripcion TEXT
);

CREATE TABLE actividades_extraescolares (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(255),
  tipo VARCHAR(255),
  duracion VARCHAR(255),
  fecha_ini DATE,
  fecha_fin DATE
);

-- Tablas dependientes
CREATE TABLE formaciones (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nombre_formacion VARCHAR(150),
  area_id INT,
  nivel_requerido VARCHAR(50),
  duracion_meses INT,
  centro VARCHAR(150),
  direccion VARCHAR(100),
  provincia INT,
  FOREIGN KEY (area_id) REFERENCES intereses(id)
);

CREATE TABLE historial_academico (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  id_estudiante INT,
  nombre_curso VARCHAR(150),
  calificacion DECIMAL(5,2),
  fecha_finalizacion DATE,
  FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id)
);

CREATE TABLE estudiantes_intereses (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  id_estudiante INT,
  id_interes INT,
  nivel_interes INT,
  FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id),
  FOREIGN KEY (id_interes) REFERENCES intereses(id)
);

CREATE TABLE estudiante_habilidades (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  id_estudiante INT,
  id_habilidad INT,
  nivel INT,
  FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id),
  FOREIGN KEY (id_habilidad) REFERENCES habilidades(id)
);

CREATE TABLE preferencias_formaciones_estudiantes (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  id_estudiante INT,
  id_formacion INT,
  nivel_interes VARCHAR(255),
  fecha_registro DATE,
  FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id),
  FOREIGN KEY (id_formacion) REFERENCES formaciones(id)
);

CREATE TABLE estudiantes_actividades (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  id_estudiante INT,
  id_actividad INT,
  fecha_inscripcion DATE,
  FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id),
  FOREIGN KEY (id_actividad) REFERENCES actividades_extraescolares(id)
);