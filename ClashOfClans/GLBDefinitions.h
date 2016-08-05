//
//  GLBDefinitions.h
//  ClashOfClans
//
//  Created by Victor Manuel Roldan on 7/23/16.
//  Copyright © 2016 Victor Roldan. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef GLBDefinitions_h
#define GLBDefinitions_h

#define baseUrl @"https://api.clashofclans.com/v1/"
#define httpContentTypeJson @"application/json"

//ENDPOINTS
#define clansUrl @"clans/"
#define clansInfoUrl @"clans/%@"
#define clansMembersUrl @"clans/%@/members"
#define clansWarLogUrl @"clans/%@/warlog"

#define locationsUrl @"locations/"



//SECURITY
#define AuthUser @"Authorization"
//tera
#define AuthPassword @"Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6ImM1ZWU1NWM1LWM4NzAtNDBiYS05Y2M5LTBkZTljZjU1OTZjZCIsImlhdCI6MTQ3MDQyNzM0OSwic3ViIjoiZGV2ZWxvcGVyL2IyOTQ3MTA0LTc4YmEtN2NhMC0yODAyLTUyMGNiZmZhNTIzNyIsInNjb3BlcyI6WyJjbGFzaCJdLCJsaW1pdHMiOlt7InRpZXIiOiJkZXZlbG9wZXIvc2lsdmVyIiwidHlwZSI6InRocm90dGxpbmcifSx7ImNpZHJzIjpbIjIwMS4yMzQuMjM3LjE1NCJdLCJ0eXBlIjoiY2xpZW50In1dfQ.Jz9U76wseBD1Ex6WpBXctrI43_QsPy3FBRS4xeXexrerYvDPgTCyIOAXRt6wPQ_TBihxraNodPO00XcjAcvtug"
//casa
//#define AuthPassword @"Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6IjFlNWQ2OGQxLTE2ZDAtNGY0NC1iN2UzLTMyNjJjYWY5N2Y1ZSIsImlhdCI6MTQ2OTI4Nzg4OSwic3ViIjoiZGV2ZWxvcGVyL2IyOTQ3MTA0LTc4YmEtN2NhMC0yODAyLTUyMGNiZmZhNTIzNyIsInNjb3BlcyI6WyJjbGFzaCJdLCJsaW1pdHMiOlt7InRpZXIiOiJkZXZlbG9wZXIvc2lsdmVyIiwidHlwZSI6InRocm90dGxpbmcifSx7ImNpZHJzIjpbIjE4Ni4xNC40MC4xMDUiXSwidHlwZSI6ImNsaWVudCJ9XX0.-7T_J5zECuggg6RLXt1EDULnFVgCTBAUs4wkx7LY2mxet5CPqhn99f0Hcoai-9xws9BlQXHCP2Z7zdtYzhLojw"


#endif /* GLBDefinitions_h */
