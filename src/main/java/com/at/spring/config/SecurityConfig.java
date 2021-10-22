package com.at.spring.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@EnableWebSecurity
@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Override
	protected void configure(HttpSecurity http) throws Exception {

		log.debug("security config {}");
		http.csrf().disable().headers().and().authorizeRequests().antMatchers("/member/login","/member/loginProcess", "/").permitAll()
				.antMatchers("/board/**", "/member/profile").hasAnyRole("ADMIN", "USER")
		.and().formLogin()
				.loginPage("/member/login").loginProcessingUrl("/member/loginProcess").defaultSuccessUrl("/").permitAll().and()
				.logout().permitAll().logoutUrl("/logout").logoutSuccessUrl("/");

	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {

		super.configure(auth);
		auth.inMemoryAuthentication().withUser("admin").password(encoder().encode("admin")).roles("ADMIN").and()
				.withUser("user").password(encoder().encode("user")).roles("USER");
	}

	@Bean
	public PasswordEncoder encoder() {
		return new BCryptPasswordEncoder();
	}
}
