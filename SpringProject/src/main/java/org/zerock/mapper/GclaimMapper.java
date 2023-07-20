package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.Gclaim;

public interface GclaimMapper {

	public List<Gclaim> selectGclaims();
	
	public Gclaim selectOneGclaim(int glno);
	
	public void insertGclaim();
	
	public void updateGclaim();
	
	public void deleteGclaim();
}
