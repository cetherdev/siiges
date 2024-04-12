<?php
require_once 'vendor/autoload.php'; 

use Endroid\QrCode\QrCode;
use Endroid\QrCode\Color\Color;
use Endroid\QrCode\Encoding\Encoding;
use Endroid\QrCode\ErrorCorrectionLevel\ErrorCorrectionLevel;
use Endroid\QrCode\Label\Label;
use Endroid\QrCode\Logo\Logo;
use Endroid\QrCode\QrCodeInterface;
use Endroid\QrCode\Writer\PngWriter;

class QR_BarCode {
    private $qrCode;

    public function __construct() {
        $this->qrCode = new QrCode();
        $this->qrCode->setEncoding(new Encoding('UTF-8'));
        $this->qrCode->setErrorCorrectionLevel(new ErrorCorrectionLevel(ErrorCorrectionLevel::HIGH));
        $this->qrCode->setSize(300);
        $this->qrCode->setMargin(10);
    }

    public function setText($text) {
        $this->qrCode->setText($text);
    }

    public function setUrl($url) {
        $this->qrCode->setText($url);
    }

    public function setEmail($email, $subject, $message) {
        $this->qrCode->setText("mailto:$email?subject=$subject&body=$message");
    }

    public function setPhone($phone) {
        $this->qrCode->setText("tel:$phone");
    }

    public function setSMS($phone, $msg) {
        $this->qrCode->setText("sms:$phone?body=$msg");
    }

    public function setVCARD($name, $address, $phone, $email) {
        $vCard = "BEGIN:VCARD\nVERSION:3.0\nFN:$name\nADR:$address\nTEL:$phone\nEMAIL:$email\nEND:VCARD";
        $this->qrCode->setText($vCard);
    }

    public function saveQRCode($path) {
        $writer = new PngWriter();
        $writer->write($this->qrCode)->saveToFile($path);
    }
}

?>