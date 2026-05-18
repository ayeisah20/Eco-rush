<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8" indent="yes" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" 
              doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>
  
  <!-- Root template -->
  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml">
      <head>
        <meta charset="UTF-8"/>
        <title>EcoRush - AI-Powered Sustainable Delivery Platform</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <style>
          * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
          }
          
          body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: #333;
            line-height: 1.6;
            padding: 20px;
          }
          
          .container {
            max-width: 1400px;
            margin: 0 auto;
            background: white;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
          }
          
          /* Header Styles */
          .header {
            background: linear-gradient(135deg, #2ecc71 0%, #27ae60 100%);
            color: white;
            padding: 40px;
            text-align: center;
          }
          
          .header h1 {
            font-size: 48px;
            margin-bottom: 10px;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.2);
          }
          
          .header .tagline {
            font-size: 20px;
            opacity: 0.95;
            margin-bottom: 15px;
          }
          
          .header .website {
            font-size: 16px;
            background: rgba(255,255,255,0.2);
            display: inline-block;
            padding: 8px 20px;
            border-radius: 25px;
            margin-top: 10px;
          }
          
          .header .location {
            font-size: 14px;
            margin-top: 10px;
            opacity: 0.9;
          }
          
          /* Navigation */
          .nav {
            background: #34495e;
            padding: 15px;
            text-align: center;
            position: sticky;
            top: 0;
            z-index: 100;
          }
          
          .nav a {
            color: white;
            text-decoration: none;
            padding: 10px 20px;
            margin: 0 5px;
            border-radius: 5px;
            transition: background 0.3s;
            display: inline-block;
          }
          
          .nav a:hover {
            background: #2ecc71;
          }
          
          /* Content Sections */
          .content {
            padding: 40px;
          }
          
          .section {
            margin-bottom: 40px;
            animation: fadeIn 0.5s ease-in;
          }
          
          @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
          }
          
          .section-title {
            font-size: 32px;
            color: #2c3e50;
            border-left: 5px solid #2ecc71;
            padding-left: 20px;
            margin-bottom: 25px;
          }
          
          /* Team Cards */
          .team-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-top: 20px;
          }
          
          .team-card {
            background: #ecf0f1;
            border-radius: 10px;
            padding: 20px;
            text-align: center;
            transition: transform 0.3s;
          }
          
          .team-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
          }
          
          .team-role {
            color: #2ecc71;
            font-weight: bold;
            font-size: 18px;
            margin-bottom: 10px;
          }
          
          .team-name {
            font-size: 16px;
            color: #34495e;
          }
          
          /* Goal Grid */
          .goals-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 25px;
            margin-top: 20px;
          }
          
          .goal-card {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            border-radius: 15px;
            padding: 25px;
            transition: all 0.3s;
          }
          
          .goal-card:hover {
            transform: scale(1.02);
          }
          
          .goal-category {
            display: inline-block;
            padding: 5px 15px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: bold;
            margin-bottom: 15px;
          }
          
          .category-Tech { background: #3498db; color: white; }
          .category-Eco { background: #2ecc71; color: white; }
          .category-Ops { background: #e67e22; color: white; }
          .category-UX { background: #9b59b6; color: white; }
          
          .goal-title {
            font-size: 22px;
            color: #2c3e50;
            margin-bottom: 15px;
          }
          
          .goal-desc {
            color: #555;
            line-height: 1.6;
          }
          
          /* Points Grid */
          .points-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 25px;
            margin-top: 20px;
          }
          
          .point-card {
            background: white;
            border: 2px solid #e0e0e0;
            border-radius: 15px;
            padding: 25px;
            transition: all 0.3s;
          }
          
          .point-card:hover {
            border-color: #2ecc71;
            box-shadow: 0 5px 20px rgba(46,204,113,0.2);
          }
          
          .point-title {
            font-size: 24px;
            color: #27ae60;
            margin-bottom: 15px;
          }
          
          /* Scope Boxes */
          .scope-container {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 25px;
            margin-top: 20px;
          }
          
          .scope-box {
            border-radius: 15px;
            padding: 25px;
          }
          
          .scope-included {
            background: #d5f4e6;
            border-left: 5px solid #2ecc71;
          }
          
          .scope-excluded {
            background: #fce4e4;
            border-left: 5px solid #e74c3c;
          }
          
          .scope-title {
            font-size: 24px;
            margin-bottom: 20px;
          }
          
          .scope-included .scope-title { color: #27ae60; }
          .scope-excluded .scope-title { color: #e74c3c; }
          
          .scope-list {
            list-style: none;
            padding-left: 0;
          }
          
          .scope-list li {
            padding: 10px 0;
            padding-left: 30px;
            position: relative;
          }
          
          .scope-list li:before {
            content: "✓";
            position: absolute;
            left: 0;
            color: #2ecc71;
            font-weight: bold;
          }
          
          .scope-excluded .scope-list li:before {
            content: "✗";
            color: #e74c3c;
          }
          
          /* Table Styles */
          .table-container {
            overflow-x: auto;
            margin-top: 20px;
          }
          
          table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
          }
          
          th {
            background: #34495e;
            color: white;
            padding: 12px;
            text-align: left;
            font-weight: bold;
          }
          
          td {
            padding: 10px 12px;
            border-bottom: 1px solid #ecf0f1;
          }
          
          tr:hover {
            background: #f5f5f5;
          }
          
          .entity-title {
            background: #27ae60;
            color: white;
            padding: 15px;
            border-radius: 10px;
            margin-top: 20px;
            margin-bottom: 10px;
          }
          
          .attribute-list {
            background: #f9f9f9;
            padding: 15px;
            border-radius: 10px;
            margin-top: 10px;
          }
          
          .key {
            color: #e74c3c;
            font-weight: bold;
          }
          
          .foreign {
            color: #3498db;
            font-weight: bold;
          }
          
          /* Footer */
          .footer {
            background: #2c3e50;
            color: white;
            text-align: center;
            padding: 20px;
            font-size: 14px;
          }
          
          /* Responsive */
          @media (max-width: 768px) {
            .content { padding: 20px; }
            .section-title { font-size: 24px; }
            .header h1 { font-size: 32px; }
            .scope-container { grid-template-columns: 1fr; }
          }
          
          /* Badges */
          .badge {
            display: inline-block;
            padding: 3px 10px;
            border-radius: 12px;
            font-size: 11px;
            font-weight: bold;
            margin-left: 10px;
          }
          
          .badge-primary { background: #2ecc71; color: white; }
          
          /* Stats */
          .stats {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            gap: 20px;
            margin: 30px 0;
          }
          
          .stat-card {
            text-align: center;
            padding: 20px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border-radius: 15px;
            color: white;
            min-width: 150px;
          }
          
          .stat-number {
            font-size: 36px;
            font-weight: bold;
          }
          
          .stat-label {
            font-size: 14px;
            margin-top: 10px;
            opacity: 0.9;
          }
        </style>
      </head>
      <body>
        <div class="container">
          <!-- Header -->
          <div class="header">
            <h1>🌿 <xsl:value-of select="ecorush/project/name"/> 🚀</h1>
            <div class="tagline"><xsl:value-of select="ecorush/project/tagline"/></div>
            <div class="website"><xsl:value-of select="ecorush/project/website"/></div>
            <div class="location">📍 <xsl:value-of select="ecorush/project/location"/></div>
          </div>
          
          <!-- Navigation -->
          <div class="nav">
            <a href="#overview">Overview</a>
            <a href="#objectives">Objectives</a>
            <a href="#importance">Importance</a>
            <a href="#scope">Scope</a>
            <a href="#database">Database</a>
            <a href="#data">Sample Data</a>
          </div>
          
          <!-- Content -->
          <div class="content">
            <!-- Team Section -->
            <div id="overview" class="section">
              <h2 class="section-title">👥 Development Team</h2>
              <div class="team-grid">
                <xsl:for-each select="ecorush/project/team/member">
                  <div class="team-card">
                    <div class="team-role"><xsl:value-of select="@role"/></div>
                    <div class="team-name"><xsl:value-of select="."/></div>
                  </div>
                </xsl:for-each>
              </div>
              
              <div class="stats">
                <div class="stat-card">
                  <div class="stat-number">
                    <xsl:value-of select="count(ecorush/sampleData/customers/customer)"/>
                  </div>
                  <div class="stat-label">Active Customers</div>
                </div>
                <div class="stat-card">
                  <div class="stat-number">
                    <xsl:value-of select="count(ecorush/sampleData/orders/order)"/>
                  </div>
                  <div class="stat-label">Orders Processed</div>
                </div>
                <div class="stat-card">
                  <div class="stat-number">
                    <xsl:value-of select="count(ecorush/sampleData/riders/rider)"/>
                  </div>
                  <div class="stat-label">Eco-Riders</div>
                </div>
              </div>
            </div>
            
            <!-- Objectives Section -->
            <div id="objectives" class="section">
              <h2 class="section-title">🎯 Objectives</h2>
              <div style="background: #ecf0f1; padding: 20px; border-radius: 10px; margin-bottom: 20px;">
                <p style="font-size: 18px; color: #2c3e50;"><strong>Main Goal:</strong> <xsl:value-of select="ecorush/objectives/main"/></p>
              </div>
              
              <div class="goals-grid">
                <xsl:for-each select="ecorush/objectives/specific/goal">
                  <div class="goal-card">
                    <span class="goal-category category-{@category}">
                      <xsl:value-of select="@category"/>
                    </span>
                    <h3 class="goal-title"><xsl:value-of select="title"/></h3>
                    <p class="goal-desc"><xsl:value-of select="description"/></p>
                  </div>
                </xsl:for-each>
              </div>
            </div>
            
            <!-- Importance Section -->
            <div id="importance" class="section">
              <h2 class="section-title">⭐ Importance</h2>
              <div class="points-grid">
                <xsl:for-each select="ecorush/importance/point">
                  <div class="point-card">
                    <h3 class="point-title"><xsl:value-of select="title"/></h3>
                    <p><xsl:value-of select="description"/></p>
                  </div>
                </xsl:for-each>
              </div>
            </div>
            
            <!-- Relevance Section -->
            <div class="section">
              <h2 class="section-title">💡 Relevance</h2>
              <div class="points-grid">
                <xsl:for-each select="ecorush/relevance/point">
                  <div class="point-card">
                    <h3 class="point-title"><xsl:value-of select="title"/></h3>
                    <p><xsl:value-of select="description"/></p>
                  </div>
                </xsl:for-each>
              </div>
            </div>
            
            <!-- Scope Section -->
            <div id="scope" class="section">
              <h2 class="section-title">📐 Project Scope</h2>
              <div class="scope-container">
                <div class="scope-box scope-included">
                  <h3 class="scope-title">✅ Included</h3>
                  <ul class="scope-list">
                    <xsl:for-each select="ecorush/scope/included/item">
                      <li><xsl:value-of select="."/></li>
                    </xsl:for-each>
                  </ul>
                </div>
                <div class="scope-box scope-excluded">
                  <h3 class="scope-title">❌ Excluded</h3>
                  <ul class="scope-list">
                    <xsl:for-each select="ecorush/scope/excluded/item">
                      <li><xsl:value-of select="."/></li>
                    </xsl:for-each>
                  </ul>
                </div>
              </div>
            </div>
            
            <!-- Database Schema Section -->
            <div id="database" class="section">
              <h2 class="section-title">🗄️ Database Schema</h2>
              <xsl:for-each select="ecorush/schema/entity">
                <div class="entity-title">
                  📊 <xsl:value-of select="@name"/>
                </div>
                <div class="attribute-list">
                  <table>
                    <thead>
                      <tr>
                        <th>Attribute</th>
                        <th>Type/Key</th>
                        <th>Description</th>
                      </tr>
                    </thead>
                    <tbody>
                      <xsl:for-each select="attribute">
                        <tr>
                          <td>
                            <xsl:value-of select="."/>
                            <xsl:if test="@key='primary'">
                              <span class="badge badge-primary">PK</span>
                            </xsl:if>
                            <xsl:if test="@key='foreign'">
                              <span class="badge badge-primary" style="background:#3498db">FK</span>
                            </xsl:if>
                          </td>
                          <td>
                            <xsl:choose>
                              <xsl:when test="@key='primary'">
                                <span class="key">Primary Key</span>
                              </xsl:when>
                              <xsl:when test="@key='foreign'">
                                <span class="foreign">Foreign Key</span>
                              </xsl:when>
                              <xsl:otherwise>Attribute</xsl:otherwise>
                            </xsl:choose>
                          </td>
                          <td>
                            <xsl:if test="@key='primary'">Unique identifier for this entity. </xsl:if>
                            <xsl:if test="@key='foreign'">References another entity. </xsl:if>
                            Main data field
                          </td>
                        </tr>
                      </xsl:for-each>
                    </tbody>
                  </table>
                  <xsl:for-each select="relationship">
                    <p style="margin-top: 10px; font-size: 14px; color: #7f8c8d;">
                      🔗 Relationship: <strong><xsl:value-of select="@type"/></strong> → 
                      <xsl:value-of select="@target"/> 
                      (<xsl:value-of select="@cardinality"/>)
                    </p>
                  </xsl:for-each>
                </div>
              </xsl:for-each>
            </div>
            
            <!-- Sample Data Section -->
            <div id="data" class="section">
              <h2 class="section-title">📊 Sample Data</h2>
              
              <h3 style="color: #27ae60; margin-top: 20px;">👤 Customers</h3>
              <div class="table-container">
                <table>
                  <thead>
                    <tr>
                      <th>Customer ID</th>
                      <th>Name</th>
                      <th>Email</th>
                      <th>Address</th>
                      <th>Phone No</th>
                    </tr>
                  </thead>
                  <tbody>
                    <xsl:for-each select="ecorush/sampleData/customers/customer">
                      <tr>
                        <td><xsl:value-of select="customerID"/></td>
                        <td><xsl:value-of select="name"/></td>
                        <td><xsl:value-of select="email"/></td>
                        <td><xsl:value-of select="address"/></td>
                        <td><xsl:value-of select="phoneNo"/></td>
                      </tr>
                    </xsl:for-each>
                  </tbody>
                </table>
              </div>
              
              <h3 style="color: #27ae60; margin-top: 30px;">📦 Orders</h3>
              <div class="table-container">
                <table>
                  <thead>
                    <tr>
                      <th>Order ID</th>
                      <th>Customer ID</th>
                      <th>Order Date</th>
                      <th>Order Place</th>
                      <th>Total Amount</th>
                    </tr>
                  </thead>
                  <tbody>
                    <xsl:for-each select="ecorush/sampleData/orders/order">
                      <tr>
                        <td><xsl:value-of select="orderID"/></td>
                        <td><xsl:value-of select="customerID"/></td>
                        <td><xsl:value-of select="orderDate"/></td>
                        <td><xsl:value-of select="orderPlace"/></td>
                        <td>₱<xsl:value-of select="totalAmount"/></td>
                      </tr>
                    </xsl:for-each>
                  </tbody>
                </table>
              </div>
              
              <h3 style="color: #27ae60; margin-top: 30px;">🏍️ Riders</h3>
              <div class="table-container">
                <table>
                  <thead>
                    <tr>
                      <th>Rider ID</th>
                      <th>Name</th>
                      <th>Email</th>
                      <th>Phone No</th>
                      <th>Address</th>
                    </tr>
                  </thead>
                  <tbody>
                    <xsl:for-each select="ecorush/sampleData/riders/rider">
                      <tr>
                        <td><xsl:value-of select="riderID"/></td>
                        <td><xsl:value-of select="name"/></td>
                        <td><xsl:value-of select="email"/></td>
                        <td><xsl:value-of select="phoneNo"/></td>
                        <td><xsl:value-of select="address"/></td>
                      </tr>
                    </xsl:for-each>
                  </tbody>
                </table>
              </div>
              
              <h3 style="color: #27ae60; margin-top: 30px;">🚚 Deliveries</h3>
              <div class="table-container">
                <table>
                  <thead>
                    <tr>
                      <th>Delivery ID</th>
                      <th>Order ID</th>
                      <th>Delivery Date</th>
                      <th>Status</th>
                      <th>Type</th>
                    </tr>
                  </thead>
                  <tbody>
                    <xsl:for-each select="ecorush/sampleData/deliveries/delivery">
                      <tr>
                        <td><xsl:value-of select="deliveryID"/></td>
                        <td><xsl:value-of select="orderID"/></td>
                        <td><xsl:value-of select="deliveryDate"/></td>
                        <td>
                          <xsl:choose>
                            <xsl:when test="deliveryStatus='Delivered'">
                              <span style="color: #27ae60; font-weight: bold;">✓ <xsl:value-of select="deliveryStatus"/></span>
                            </xsl:when>
                            <xsl:otherwise>
                              <span style="color: #e67e22;">🚚 <xsl:value-of select="deliveryStatus"/></span>
                            </xsl:otherwise>
                          </xsl:choose>
                        </td>
                        <td><xsl:value-of select="deliveryType"/></td>
                      </tr>
                    </xsl:for-each>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
          
          <!-- Footer -->
          <div class="footer">
            <p>🌱 EcoRush - Sustainable Delivery Platform | Lipa City, Batangas</p>
            <p style="margin-top: 10px; font-size: 12px;">© 2025 EcoRush. All rights reserved. | Zero Emissions Commitment</p>
          </div>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>