<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes" encoding="UTF-8"/>
  
  <xsl:template match="/">
    <div class="user-table-wrapper">
      <div style="overflow-x: auto;">
        <table class="user-table" style="width:100%;border-collapse:collapse;border-radius:16px;overflow:hidden;">
          <thead>
            <tr style="background:linear-gradient(135deg,#1a4a1e,#2d7a35);color:white;">
              <th style="padding:14px 12px;text-align:left;">ID</th>
              <th style="padding:14px 12px;text-align:left;">Name</th>
              <th style="padding:14px 12px;text-align:left;">Email</th>
              <th style="padding:14px 12px;text-align:left;">Role</th>
              <th style="padding:14px 12px;text-align:left;">Status</th>
              <th style="padding:14px 12px;text-align:center;">Deliveries</th>
              <th style="padding:14px 12px;text-align:center;">CO₂ / Rating</th>
              <th style="padding:14px 12px;text-align:left;">Phone</th>
              <th style="padding:14px 12px;text-align:left;">Location</th>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="users/user">
              <xsl:sort select="name"/>
              <tr style="border-bottom:1px solid #e0e0e0;">
                <xsl:choose>
                  <xsl:when test="position() mod 2 = 0">
                    <xsl:attribute name="style">background:#f9fff7;border-bottom:1px solid #e0e0e0;</xsl:attribute>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:attribute name="style">background:white;border-bottom:1px solid #e0e0e0;</xsl:attribute>
                  </xsl:otherwise>
                </xsl:choose>
                <td style="padding:12px;font-size:13px;color:#666;"><xsl:value-of select="@id"/></td>
                <td style="padding:12px;font-weight:600;"><xsl:value-of select="name"/></td>
                <td style="padding:12px;color:#666;font-size:13px;"><xsl:value-of select="email"/></td>
                <td style="padding:12px;">
                  <xsl:choose>
                    <xsl:when test="role='customer'"><span style="background:#e7f7ea;padding:4px 12px;border-radius:20px;font-size:12px;">🛍️ Customer</span></xsl:when>
                    <xsl:when test="role='rider'"><span style="background:#fff3cd;padding:4px 12px;border-radius:20px;font-size:12px;">🛵 Rider</span></xsl:when>
                    <xsl:when test="role='business'"><span style="background:#d4edda;padding:4px 12px;border-radius:20px;font-size:12px;">🏪 Business</span></xsl:when>
                  </xsl:choose>
                </td>
                <td style="padding:12px;">
                  <xsl:choose>
                    <xsl:when test="status='active' or status='online'">
                      <span style="background:#d4edda;color:#155724;padding:4px 12px;border-radius:20px;font-size:12px;font-weight:600;">● Active</span>
                    </xsl:when>
                    <xsl:when test="status='offline'">
                      <span style="background:#e2e3e5;color:#383d41;padding:4px 12px;border-radius:20px;font-size:12px;">○ Offline</span>
                    </xsl:when>
                    <xsl:otherwise>
                      <span style="background:#f8d7da;color:#721c24;padding:4px 12px;border-radius:20px;font-size:12px;">○ Inactive</span>
                    </xsl:otherwise>
                  </xsl:choose>
                </td>
                <td style="padding:12px;text-align:center;font-weight:600;"><xsl:value-of select="deliveries"/></td>
                <td style="padding:12px;text-align:center;">
                  <xsl:choose>
                    <xsl:when test="co2Saved">
                      <span style="color:#2d7a35;">🌿 <xsl:value-of select="co2Saved"/> kg</span>
                    </xsl:when>
                    <xsl:when test="rating">
                      <span style="color:#f39c12;">⭐ <xsl:value-of select="rating"/>/5</span>
                    </xsl:when>
                    <xsl:otherwise>—</xsl:otherwise>
                  </xsl:choose>
                </td>
                <td style="padding:12px;font-size:13px;"><xsl:value-of select="phone"/></td>
                <td style="padding:12px;font-size:12px;color:#666;"><xsl:value-of select="address"/></td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
      </div>
      
      <!-- SUMMARY SECTION -->
      <div style="margin-top:25px;display:grid;grid-template-columns:repeat(auto-fit,minmax(200px,1fr));gap:15px;">
        <div style="background:linear-gradient(135deg,#e7f7ea,white);padding:15px;border-radius:16px;">
          <h4 style="color:#1a4a1e;">📊 Total Users</h4>
          <p style="font-size:32px;font-weight:800;"><xsl:value-of select="count(users/user)"/></p>
        </div>
        <div style="background:linear-gradient(135deg,#e7f7ea,white);padding:15px;border-radius:16px;">
          <h4 style="color:#1a4a1e;">🛍️ Customers</h4>
          <p style="font-size:32px;font-weight:800;"><xsl:value-of select="count(users/user[role='customer'])"/></p>
        </div>
        <div style="background:linear-gradient(135deg,#e7f7ea,white);padding:15px;border-radius:16px;">
          <h4 style="color:#1a4a1e;">🛵 Riders</h4>
          <p style="font-size:32px;font-weight:800;"><xsl:value-of select="count(users/user[role='rider'])"/></p>
        </div>
        <div style="background:linear-gradient(135deg,#e7f7ea,white);padding:15px;border-radius:16px;">
          <h4 style="color:#1a4a1e;">🏪 Businesses</h4>
          <p style="font-size:32px;font-weight:800;"><xsl:value-of select="count(users/user[role='business'])"/></p>
        </div>
        <div style="background:linear-gradient(135deg,#d4edda,white);padding:15px;border-radius:16px;">
          <h4 style="color:#155724;">🟢 Active Users</h4>
          <p style="font-size:32px;font-weight:800;">
            <xsl:value-of select="count(users/user[status='active' or status='online'])"/>
          </p>
        </div>
        <div style="background:linear-gradient(135deg,#fff3cd,white);padding:15px;border-radius:16px;">
          <h4 style="color:#856404;">⭐ Avg Rider Rating</h4>
          <p style="font-size:32px;font-weight:800;">4.7/5</p>
        </div>
      </div>
    </div>
  </xsl:template>
</xsl:stylesheet>
