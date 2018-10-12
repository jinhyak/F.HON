package hj.logic;


import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hj.dao.ReservationDao;

@Service
public class ReservationLogic {
	Logger logger = Logger.getLogger(ReservationLogic.class);
	
	@Autowired
	private ReservationDao reservationDao = null;
}
