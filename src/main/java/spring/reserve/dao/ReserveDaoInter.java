package spring.reserve.dao;

import java.util.List;

import spring.dto.ReserveDto;

public interface ReserveDaoInter {
	//출력
	public String getTotalCount(String rmnum);
	public void insertReserve(ReserveDto dto);
	public ReserveDto getData(String rnum);
	public List<ReserveDto> getAllDatas();
	
	//수정
	public void updateReserve(ReserveDto dto);
	public void deleteReserve(String rnum);
	
	public List<ReserveDto> getDataRm(String rmnum);
}
