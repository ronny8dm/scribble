package com.scribble.config;

import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.persistence.EntityManagerFactory;
import javax.sql.DataSource;

import org.hibernate.jpa.HibernatePersistenceProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.zaxxer.hikari.HikariDataSource;

@Configuration
@PropertySource("classpath:database.properties")
@EnableTransactionManagement
@EnableJpaRepositories(basePackages = "com.scribble.repository")
public class JpaConfig {

    @Autowired
    private Environment env;

    private Logger logger = Logger.getLogger(getClass().getName());

    @Bean
    public DataSource dataSource() {
        HikariDataSource dataSource = new HikariDataSource();
        dataSource.setDriverClassName(getRequiredProperty("jdbc.driverClassName"));
        dataSource.setJdbcUrl(getRequiredProperty("jdbc.url"));
        dataSource.setUsername(getRequiredProperty("jdbc.username"));
        dataSource.setPassword(getRequiredProperty("jdbc.password"));
        dataSource.setMinimumIdle(Integer.parseInt(getRequiredProperty("hikari.minimumIdle")));
        dataSource.setMaximumPoolSize(Integer.parseInt(getRequiredProperty("hikari.maximumPoolSize")));
        dataSource.setIdleTimeout(Long.parseLong(getRequiredProperty("hikari.idleTimeout")));

        logger.log(Level.INFO, "Connecting to database");
        return dataSource;
    }

    @Bean
    public LocalContainerEntityManagerFactoryBean entityManagerFactory() {
        LocalContainerEntityManagerFactoryBean em = new LocalContainerEntityManagerFactoryBean();
        em.setDataSource(dataSource());
        em.setPackagesToScan(new String[]{"com.scribble.entity"});
        em.setPersistenceProviderClass(HibernatePersistenceProvider.class);

        Properties properties = new Properties();
        properties.put("hibernate.dialect", getRequiredProperty("hibernate.dialect"));
        properties.put("hibernate.show_sql", getRequiredProperty("hibernate.show_sql"));
        properties.put("hibernate.format_sql", getRequiredProperty("hibernate.format_sql"));
        properties.put("hibernate.hbm2ddl.auto", getRequiredProperty("hibernate.hbm2ddl.auto"));

        em.setJpaProperties(properties);
        return em;
    }

    @Bean
    public JpaTransactionManager transactionManager(EntityManagerFactory emf) {
        JpaTransactionManager transactionManager = new JpaTransactionManager();
        transactionManager.setEntityManagerFactory(emf);
        return transactionManager;
    }

    private String getRequiredProperty(String key) {
        return env.getRequiredProperty(key);
    }
}
