package com.pk.account;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Account {
  @NotNull
  Integer id;
  @NotNull
  @NotBlank
  String login;
  @NotNull
  @NotBlank
  String password;
  @NotNull
  @NotBlank
  @Email
  String email;
  @NotNull
  Privilege privilege;
}
