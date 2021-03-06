<?php

require_once $url;

class Keuangan{

    private $db;
    private $dbh;

    public function __construct(){
        
        $this->dbh = new Connection;
        $this->db = $this->dbh->getConn();

    }

    public function currentMonth(){
        
        $result = $this->db->query("SELECT SUM(nominal) AS income FROM pembayaran WHERE date_format(CURDATE(), '%Y') = YEAR(tanggal) AND date_format(CURDATE(), '%m') = MONTH(tanggal) ORDER BY YEAR(tanggal), MONTH(tanggal) ASC");

        return $result->fetch_assoc();
        
    }

    public function penalties(){

        $result = $this->db->query("SELECT MONTH(tanggal_kembali) AS bulan, SUM(nominal) AS denda FROM pinjam INNER JOIN pembayaran ON pinjam.id_pinjam = pembayaran.id_pinjam WHERE date_format(CURDATE(), '%Y') = YEAR(tanggal_kembali) AND date_format(CURDATE(), '%m') = MONTH(tanggal_kembali) AND keterangan IN ('Denda') ORDER BY YEAR(tanggal_kembali), MONTH(tanggal_kembali) ASC");

        return $result->fetch_assoc();

    }

    public function currentYear(){

    }

}