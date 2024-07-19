package com.example.usermanagement.service;

import com.example.usermanagement.enums.Role;
import com.example.usermanagement.model.response.GetUserPermissionsResponse;
import org.springframework.http.ResponseEntity;
import com.example.usermanagement.model.response.ResponseObject;
import com.example.usermanagement.model.request.UpdatePermissionRequest;

import java.util.List;

public interface UserPermissionService {
    ResponseEntity<ResponseObject> grantPermission(int userID, Role role);

    List<GetUserPermissionsResponse> getUserPermission();
    ResponseObject updatePermission(List<UpdatePermissionRequest> updateRequest);
}