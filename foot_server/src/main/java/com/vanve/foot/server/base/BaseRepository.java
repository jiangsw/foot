package com.vanve.school.assess.repository;

import java.io.Serializable;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.NoRepositoryBean;

@NoRepositoryBean
public interface BaseRepository<T, ID extends Serializable> extends JpaRepository<T, ID> {

  @Query(value = "select get_code(?1,?2,?3)", nativeQuery = true)
  String getCode(int flag, int id, int len);
}