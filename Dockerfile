FROM quay.io/wildfly/wildfly:27.0.0.Final-jdk17

# Créer un utilisateur pour la console d'administration WildFly
RUN /opt/jboss/wildfly/bin/add-user.sh admin admin --silent

COPY ./target/giftefrei.war /opt/jboss/wildfly/standalone/deployments/

# Définir les variables d'environnement pour la connexion à la base de données PostgreSQL
ENV POSTGRES_HOST=db
ENV POSTGRES_PORT=5432
ENV POSTGRES_DATABASE=giftefrei
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=postgres

# Lancer WildFly avec les options de configuration pour la base de données PostgreSQL
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0", "-Djboss.http.port=8080", "-Dpostgresql.host=$POSTGRES_HOST", "-Dpostgresql.port=$POSTGRES_PORT", "-Dpostgresql.database=$POSTGRES_DATABASE", "-Dpostgresql.user=$POSTGRES_USER", "-Dpostgresql.password=$POSTGRES_PASSWORD"]