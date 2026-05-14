<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html" indent="yes"/>

<xsl:template match="/">

<html>
<head>
    <title>Student Service Request</title>

    <style>
        body{
            margin:0;
            padding:0;
            font-family: Arial, sans-serif;
            background:#e6e6eb;
        }

        .container{
            display:flex;
            justify-content:space-between;
            padding:25px;
            gap:30px;
        }

        .left-panel{
            width:78%;
        }

        .title{
            font-size:32px;
            font-weight:bold;
            color:#1f5fa8;
            letter-spacing:1px;
            margin-bottom:40px;
        }

        table{
            width:100%;
            border-collapse:collapse;
            background:transparent;
        }

        th{
            background:#eea121;
            color:white;
            padding:18px 10px;
            font-size:15px;
            text-align:center;
        }

        td{
            padding:16px 10px;
            text-align:center;
            border-bottom:1px solid #e3b36a;
            font-size:14px;
            color:#444;
        }

        tr:hover{
            background:#f5f5f5;
        }

        .approved{
            color:#17a52b;
            font-weight:bold;
        }

        .pending{
            color:#d8b323;
            font-weight:bold;
        }

        .released{
            color:#ff2b2b;
            font-weight:bold;
        }

        .right-panel{
            width:22%;
        }

        .overview-title{
            color:#1f5fa8;
            font-size:18px;
            font-weight:bold;
            margin-top:30px;
            margin-bottom:20px;
            text-align:center;
        }

        .card{
            width:145px;
            height:110px;
            border-radius:14px;
            margin:0 auto 18px auto;
            display:flex;
            flex-direction:column;
            justify-content:center;
            align-items:center;
        }

        .card-title{
            font-size:14px;
            font-weight:bold;
            margin-bottom:10px;
        }

        .card-number{
            font-size:56px;
            font-weight:bold;
            line-height:50px;
        }

        .approved-card{
            background:#abd2ae;
        }

        .approved-card .card-title,
        .approved-card .card-number{
            color:#12a824;
        }

        .pending-card{
            background:#efe1a9;
        }

        .pending-card .card-title,
        .pending-card .card-number{
            color:#f0c93b;
        }

        .released-card{
            background:#efb0b0;
        }

        .released-card .card-title,
        .released-card .card-number{
            color:#ff2b2b;
        }
    </style>
</head>

<body>

    <div class="container">

        <!-- LEFT SIDE -->
        <div class="left-panel">

            <div class="title">
                STUDENT SERVICE REQUEST
            </div>

            <table>

                <tr>
                    <th>ID Number</th>
                    <th>StudentName</th>
                    <th>Document Type</th>
                    <th>Date Requested</th>
                    <th>Status</th>
                    <th>Release Date</th>
                </tr>

                <xsl:for-each select="StudentServicesRequestSystem/Request">

                    <tr>

                        <td>
                            <xsl:value-of select="@studentID"/>
                        </td>

                        <td>
                            <xsl:value-of select="StudentName"/>
                        </td>

                        <td>
                            <xsl:value-of select="RequestType"/>
                        </td>

                        <td>
                            <xsl:value-of select="DateRequested"/>
                        </td>

                        <td>
                            <xsl:choose>

                                <xsl:when test="Status='Approved'">
                                    <span class="approved">
                                        <xsl:value-of select="Status"/>
                                    </span>
                                </xsl:when>

                                <xsl:when test="Status='Pending'">
                                    <span class="pending">
                                        <xsl:value-of select="Status"/>
                                    </span>
                                </xsl:when>

                                <xsl:otherwise>
                                    <span class="released">
                                        <xsl:value-of select="Status"/>
                                    </span>
                                </xsl:otherwise>

                            </xsl:choose>
                        </td>

                        <td>
                            <xsl:value-of select="ReleaseDate"/>
                        </td>

                    </tr>

                </xsl:for-each>

            </table>

        </div>

        <div class="right-panel">

            <div class="overview-title">
                Status Overview
            </div>

            <!-- APPROVED -->
            <div class="card approved-card">

                <div class="card-title">
                    APPROVED
                </div>

                <div class="card-number">
                    <xsl:value-of 
                    select="count(StudentServicesRequestSystem/Request[Status='Approved'])"/>
                </div>

            </div>

            <div class="card pending-card">

                <div class="card-title">
                    PENDING
                </div>

                <div class="card-number">
                    <xsl:value-of 
                    select="count(StudentServicesRequestSystem/Request[Status='Pending'])"/>
                </div>

            </div>

            <!-- RELEASED -->
            <div class="card released-card">

                <div class="card-title">
                    RELEASED
                </div>

                <div class="card-number">
                    <xsl:value-of 
                    select="count(StudentServicesRequestSystem/Request[Status='Released'])"/>
                </div>

            </div>

        </div>

    </div>

</body>
</html>

</xsl:template>

</xsl:stylesheet>