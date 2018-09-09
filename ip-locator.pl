#!/usr/bin/perl
# Ip Geolocation 
#By : Z-hacker


use Socket;
use Term::ANSIColor;
use WWW::Mechanize;
use JSON;
  
 
print color 'bold bright_green';
 
print q{

########         ##     ##    ###     ######  ##    ## ######## ########  
     ##          ##     ##   ## ##   ##    ## ##   ##  ##       ##     ## 
    ##           ##     ##  ##   ##  ##       ##  ##   ##       ##     ## 
   ##    ####### ######### ##     ## ##       #####    ######   ########  
  ##             ##     ## ######### ##       ##  ##   ##       ##   ##   
 ##              ##     ## ##     ## ##    ## ##   ##  ##       ##    ##  
########         ##     ## ##     ##  ######  ##    ## ######## ##     ## 


 #       #######  #####     #    #       ### #######    #     #####  ### ####### #     #       ### ######  
 #       #     # #     #   # #   #        #       #    # #   #     #  #  #     # ##    #        #  #     # 
 #       #     # #        #   #  #        #      #    #   #  #        #  #     # # #   #        #  #     # 
 #       #     # #       #     # #        #     #    #     # #        #  #     # #  #  # #####  #  ######  
 #       #     # #       ####### #        #    #     ####### #        #  #     # #   # #        #  #       
 #       #     # #     # #     # #        #   #      #     # #     #  #  #     # #    ##        #  #       
 ####### #######  #####  #     # ####### ### ####### #     #  #####  ### ####### #     #       ### #       
                                                                                                                                                                                                                                                      

      --------------------------------------
      |           Ip Geolocation Tool      |
      |            By : Z-hacker           |                                
      |  Traducido al Español por : L4MP   |
       ------------------------------------   
      |      [FOLLOW US ON YOUTUBE]        |  
      |    :. https://goo.gl/83QFyp .:     |
       ------------------------------------   
       
};


 
print color 'bold bright_green';
@iphost=$ARGV[0] || die "Usage : ./ip-locator.pl  [Direccion IP] \n        ./ip-locator.pl  [Dominio] \n        ./ip-locator.pl  [host] \n \n";
my @ip = inet_ntoa(scalar gethostbyname("@iphost")or die "IP o Host Invalido!\n");
my @hn = scalar gethostbyaddr(inet_aton(@ip),AF_INET);
 
my $GET=WWW::Mechanize->new();
    $GET->get("http://ip-api.com/json/@ip"); # JSON API OF IP-API.COM
    my $json = $GET->content();
 
 
my $info = decode_json($json);
# Json API Response :
# A successful request will return, by default, the following:
#{
#    "status": "success",
#    "country": "COUNTRY",
#    "countryCode": "COUNTRY CODE",
#    "region": "REGION CODE",
#    "regionName": "REGION NAME",
#    "city": "CITY",
#    "zip": "ZIP CODE",
#    "lat": LATITUDE,
#    "lon": LONGITUDE,
#    "timezone": "TIME ZONE",
#    "isp": "ISP NAME",
#    "org": "ORGANIZATION NAME",
#    "as": "AS NUMBER / NAME",
#   "query": "IP ADDRESS USED FOR QUERY"
# }
# INFOS OF JSON API ...
 
 
print color 'bold bright_white';
print "     [!] IP: ", $info->{'query'}, "\n";
print color 'bold bright_green';
print "-----------------------------------------\n"; 
print color 'bold bright_green';
print "     [+] ORG: ", $info->{'as'}, "\n";
print "     [+] ISP: ", $info->{'isp'}, "\n";
print "     [+] Estado: ", $info->{'country'}," - ", $info->{'countryCode'}, "\n";
print "     [+] Region: ", $info->{'regionName'}, " - " , $info->{'region'}, "\n";
print "     [+] Ciudad: ", $info->{'city'}, "\n";
print color 'white';
print q{     [!] La Localizacion: No Puede Ser Precisa  
}; "\n";
print color 'bold bright_blue';
print "     [+] Geo: ", "Latitud: " , $info->{'lat'}, " - Longitud: ", $info->{'lon'}, "\n";
print "     [+] Geolocalizacion: ", "Lat: " , $info->{'lat'}, " - Lat: ", $info->{'lat'}, "\n";
print color 'bold bright_green';
print "     [+] Zona Horaria: ",   , $info->{'timezone'}, " - Long: ", $info->{'timezone'}, "\n";
print "     [+] As numero/nombre: ", "as: " , $info->{'as'}, " - Long: ", $info->{'as'}, "\n";
print "     [+] ORG name: ", $info->{'as'}, "\n";
print "     [+] Codigo Postal: ", $info->{'countryCode'}, "\n";
print color 'bold bright_green';
print "     [+] Status: ", $info->{'status'}, "\n"; 
print "\n";
# EOF
