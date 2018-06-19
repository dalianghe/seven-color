package com.github.dalianghe.admin.service.impl;

import com.github.dalianghe.admin.entity.Investigate;
import com.github.dalianghe.admin.mapper.InvestigateMapper;
import com.github.dalianghe.admin.service.IinvestigateService;
import com.github.dalianghe.core.base.BaseMapper;
import com.github.dalianghe.core.base.impl.BaseServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class InvestigateServiceImpl extends BaseServiceImpl<Investigate,String> implements IinvestigateService {

    @Autowired
    private InvestigateMapper investigateMapper;

    @Override
    public BaseMapper<Investigate, String> getMappser() {
        return investigateMapper;
    }



}
