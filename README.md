# Modelamiento-base-de-dtos

Sistema de Gestión y Seguimiento de Servicios en Tambos del Programa Nacional PAIS
1. Descripción general del caso

El Programa Nacional PAIS del Ministerio de Desarrollo e Inclusión Social (MIDIS) tiene como finalidad acercar los servicios del Estado a las poblaciones rurales y de difícil acceso mediante los Tambos, plataformas multisectoriales ubicadas estratégicamente en diferentes regiones del país.

Actualmente, la información relacionada con los servicios brindados en los Tambos es registrada por diferentes entidades y en diversos formatos, generando dificultades para consolidar datos, realizar seguimiento de atenciones y obtener reportes oportunos para la toma de decisiones.

Las entidades participantes elaboran planes de trabajo y realizan intervenciones en los Tambos, donde brindan diversos servicios a la población. Durante una intervención pueden ofrecerse varios servicios y una misma persona puede recibir uno o más servicios, generándose múltiples atenciones.

Por ello, se propone desarrollar un Sistema de Gestión y Seguimiento de Servicios en Tambos, que permita registrar información sobre los Tambos, gestores institucionales, campañas sociales, entidades participantes, servicios brindados y población atendida.

El sistema permitirá centralizar la información operativa de las intervenciones realizadas en los Tambos, facilitando el monitoreo de actividades, la generación de indicadores y el seguimiento de beneficiarios atendidos en zonas rurales.



2. Problemática identificada

Actualmente se presentan las siguientes dificultades:

Información dispersa en archivos Excel y reportes manuales.
Duplicidad de registros de beneficiarios.
Dificultad para consolidar atenciones multisectoriales.
Retrasos en la generación de reportes estadísticos.
Limitaciones para realizar seguimiento de campañas sociales.
Inconsistencias en la información remitida por los Tambos.

3. Objetivo del sistema

La base de datos tiene como finalidad centralizar, organizar y gestionar la información relacionada con las intervenciones multisectoriales realizadas en los Tambos del Programa Nacional PAIS que permitira

Registrar entidades articuladas.
Gestionar planes de trabajo.
Registrar intervenciones realizadas en los Tambos.
Registrar los servicios brindados.
Registrar beneficiarios atendidos.
Llevar el control de atenciones.
Generar reportes e indicadores para la toma de decisiones.

4. Alcance del sistema

El sistema administrará la información relacionada con:

Módulo de Tambos

Registro y administración de los Tambos implementados.

Módulo de Gestores

Registro de gestores institucionales responsables de cada Tambo.

Módulo de Entidades Participantes

Registro de ministerios e instituciones que brindan servicios.

Módulo de Campañas Sociales

Gestión de campañas e intervenciones realizadas.

Módulo de Beneficiarios

Registro de ciudadanos atendidos.

Módulo de Servicios

Control de servicios brindados durante campañas o actividades.

Módulo de Reportes

Generación de estadísticas e indicadores.

5. Requerimientos funcionales

El sistema deberá permitir:

Registrar Tambos y su ubicación geográfica.
Registrar gestores responsables.
Registrar entidades participantes.
Programar campañas sociales.
Registrar servicios brindados.
Registrar beneficiarios atendidos.
Consultar historial de atenciones por beneficiario.
Generar reportes por región, provincia y distrito.
Generar indicadores de cobertura y atención.

6. Reglas de negocio
Un Tambo puede realizar muchas campañas sociales.
Cada campaña se realiza en un único Tambo.
Una entidad puede participar en varias campañas.
Una campaña puede incluir varias entidades participantes.
Un beneficiario puede recibir múltiples servicios.
Cada servicio pertenece a una campaña.
Todo gestor está asignado a un Tambo.
No puede registrarse una atención sin beneficiario identificado.
Cada Tambo pertenece a una región, provincia y distrito.

7. Posibles entidades identificadas
Tambo
Gestor
Campaña
Entidad Participante
Beneficiario
Servicio
Atención
Ubigeo
Reporte

