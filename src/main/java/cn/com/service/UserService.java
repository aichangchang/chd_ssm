package cn.com.service;


import cn.com.bean.User;
public interface UserService {
   public User fingUserByUsername(String username);
   public void register(String username,String password,String email);
}
