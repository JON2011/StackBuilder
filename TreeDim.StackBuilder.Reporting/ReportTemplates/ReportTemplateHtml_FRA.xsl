<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="report">
    <html>
      <head>
        <title>
          Rapport<xsl:value-of select="name"/>
        </title>
        <style type="text/css">
          .style1
          {
          width: 100%;
          }
          .style2
          {
          background-color: #CCCCCC;
          }
          .style3
          {
          }
        </style>
      </head>
      <body>
        <h4 style="text-align:center">
          Rapport généré par treeDiM StackBuilder
        </h4>
        <table border="0" cellpadding="3">
          <tr>
            <td class="style2">
              <b>Document:</b>
            </td>
            <td class="style3" colspan="2">
              <xsl:value-of select="name"/>
            </td>
          </tr>
          <tr>
            <td class="style2">
              <b>Description:</b>
            </td>
            <td class="style3" colspan="2">
              <xsl:value-of select="description"/>
            </td>
          </tr>
          <tr>
            <td class="style2">
              <b>Date:</b>
            </td>
            <td class="style3" colspan="1">
              <xsl:value-of select="dateOfCreation"/>
            </td>
            <td class="style2">
              <b>Auteur:</b>
            </td>
            <td class="style3" colspan="1">
              <xsl:value-of select="author"/>
            </td>
          </tr>
        </table>
        <xsl:apply-templates select="palletAnalysis"/>
        <xsl:apply-templates select="truckAnalysis"/>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="palletAnalysis">
    <h2 style="font-family:arial;color:red;">Analyse de palette</h2>
    <xsl:apply-templates select="case"/>
    <xsl:apply-templates select="bundle"/>
    <xsl:apply-templates select="box"/>
    <xsl:apply-templates select="caseOfBoxes"/>
    <xsl:apply-templates select="interlayer"/>
    <xsl:apply-templates select="pallet"/>
    <xsl:apply-templates select="constraintSet"/>
    <xsl:apply-templates select="caseOptimConstraintSet"/>
    <xsl:apply-templates select="palletSolution"/>
  </xsl:template>
  <xsl:template match="truckAnalysis">
    <h2 style="font-familly:arial;color:red;">Analyse chargement camion</h2>
    <xsl:apply-templates select="truck"/>
    <xsl:apply-templates select="truckSolution"/>
  </xsl:template>
  <!-- #### CASE ####-->
  <xsl:template match="case">
    <h3 style="font-family:arial;color:blue;">Caisse</h3>
    <table class="style1" cellpadding="3">
      <tr>
        <td class="style2" colspan="1">
          <b>Nom:</b>
        </td>
        <td class="style3" colspan="2">
          <xsl:value-of select="name"/>
        </td>
      </tr>
      <tr>
        <td class="style2" colspan="1">
          <b>Description:</b>
        </td>
        <td class="style3" colspan="2">
          <xsl:value-of select="description"/>
        </td>
      </tr>
      <tr>
        <td  class="style2" colspan="1">
          <b>Longueur (mm):</b>
        </td>
        <td class="style3" colspan="1">
          <xsl:value-of select="length"/>
        </td>
        <td rowspan="5">
          <xsl:apply-templates select="view_case_iso"/>
        </td>
      </tr>
      <tr>
        <td  class="style2">
          <b>Largeur (mm):</b>
        </td>
        <td class="style3" colspan="1">
          <xsl:value-of select="width"/>
        </td>
      </tr>
      <tr>
        <td  class="style2">
          <b>Hauteur (mm):</b>
        </td>
        <td class="style3" colspan="1">
          <xsl:value-of select="height"/>
        </td>
      </tr>
      <tr>
        <td  class="style2">
          <b>Masse (kg):</b>
        </td>
        <td class="style3" colspan="1">
          <xsl:value-of select="weight"/>
        </td>
      </tr>
      <tr>
        <td  class="style2">
          <b>Charge admissible sur le dessus (kg):</b>
        </td>
        <td class="style3" colspan="1">
          <xsl:value-of select="admissibleLoad"/>
        </td>
      </tr>
    </table>
  </xsl:template>
  <!-- #### PALLET ####-->
  <xsl:template match="pallet">
    <h3 style="font-family:arial;color:blue;">Pallet</h3>
    <table class="style1" cellpadding="3">
      <tr>
        <td  class="style2" colspan="1">
          <b>Nom:</b>
        </td>
        <td class="style3" colspan="2">
          <xsl:value-of select="name"/>
        </td>
      </tr>
      <tr>
        <td  class="style2" colspan="1">
          <b>Description:</b>
        </td>
        <td class="style3" colspan="2">
          <xsl:value-of select="description"/>
        </td>
      </tr>
      <tr>
        <td  class="style2" colspan="1">
          <b>Longueur (mm):</b>
        </td>
        <td class="style3" colspan="1">
          <xsl:value-of select="length"/>
        </td>
        <td rowspan="5">
          <xsl:apply-templates select="view_pallet_iso"/>
        </td>
      </tr>
      <tr>
        <td  class="style2" colspan="1">
          <b>Largeur (mm):</b>
        </td>
        <td class="style3" colspan="1">
          <xsl:value-of select="width"/>
        </td>
      </tr>
      <tr>
        <td  class="style2" colspan="1">
          <b>Hauteur (mm):</b>
        </td>
        <td class="style3" colspan="1">
          <xsl:value-of select="height"/>
        </td>
      </tr>
      <tr>
        <td  class="style2" colspan="1">
          <b>Masse (kg):</b>
        </td>
        <td class="style3" colspan="1">
          <xsl:value-of select="weight"/>
        </td>
      </tr>
      <tr>
        <td  class="style2" colspan="1">
          <b>Charge admissible (kg):</b>
        </td>
        <td class="style3" colspan="1">
          <xsl:value-of select="admissibleLoad"/>
        </td>
      </tr>
    </table>
  </xsl:template>
  <!--BOX-->
  <xsl:template match="box">
    <h3 style="font-family:arial;color:blue;">Box</h3>
    <table class="style1">
      <tr>
        <td class="style2" colspan="1">
          <b>Nom:</b>
        </td>
        <td class="style3" colspan="2">
          <xsl:value-of select="name"/>
        </td>
      </tr>
      <tr>
        <td class="style2" colspan="1">
          <b>Description:</b>
        </td>
        <td class="style3" colspan="2">
          <xsl:value-of select="description"/>
        </td>
      </tr>
      <tr>
        <td  class="style2" colspan="1">
          <b>Longueur (mm):</b>
        </td>
        <td class="style3" colspan="1">
          <xsl:value-of select="length"/>
        </td>
        <td rowspan="4">
          <xsl:apply-templates select="view_box_iso"/>
        </td>
      </tr>
      <tr>
        <td  class="style2">
          <b>Largeur (mm):</b>
        </td>
        <td class="style3" colspan="1">
          <xsl:value-of select="width"/>
        </td>
      </tr>
      <tr>
        <td  class="style2">
          <b>Hauteur (mm):</b>
        </td>
        <td class="style3" colspan="1">
          <xsl:value-of select="height"/>
        </td>
      </tr>
      <tr>
        <td  class="style2">
          <b>Masse (kg):</b>
        </td>
        <td class="style3" colspan="1">
          <xsl:value-of select="weight"/>
        </td>
      </tr>
    </table>
  </xsl:template>
  <!--#### INTERLAYER ####-->
  <xsl:template match="interlayer">
    <h3 style="font-family:arial;color:blue;">Interlayer</h3>
    <table class="style1">
      <tr>
        <td  class="style2">
          <b>Nom:</b>
        </td>
        <td class="style3" colspan="2">
          <xsl:value-of select="name"/>
        </td>
      </tr>
      <tr>
        <td  class="style2">
          <b>Description:</b>
        </td>
        <td class="style3" colspan="2">
          <xsl:value-of select="description"/>
        </td>
      </tr>
      <tr>
        <td  class="style2">
          <b>Longueur (mm):</b>
        </td>
        <td class="style3">
          <xsl:value-of select="length"/>
        </td>
        <td rowspan="4">
          <xsl:apply-templates select="view_interlayer_iso"/>
        </td>
      </tr>
      <tr>
        <td  class="style2">
          <b>Largeur (mm):</b>
        </td>
        <td class="style3">
          <xsl:value-of select="width"/>
        </td>
      </tr>
      <tr>
        <td  class="style2">
          <b>Epaisseur (mm):</b>
        </td>
        <td class="style3">
          <xsl:value-of select="thickness"/>
        </td>
      </tr>
      <tr>
        <td  class="style2">
          <b>Masse (kg):</b>
        </td>
        <td class="style3">
          <xsl:value-of select="weight"/>
        </td>
      </tr>
    </table>
  </xsl:template>
  <!--#### BUNDLE ####-->
  <xsl:template match="bundle">
    <h3 style="font-family:arial;color:blue;">Liasse</h3>
    <table class="style1">
      <tr>
        <td  class="style2">
          <b>Nom:</b>
        </td>
        <td colspan="2">
          <xsl:value-of select="name"/>
        </td>
      </tr>
      <tr>
        <td  class="style2">
          <b>Description:</b>
        </td>
        <td colspan="2">
          <xsl:value-of select="description"/>
        </td>
      </tr>
      <tr>
        <td  class="style2">
          <strong>Longueur (mm):</strong>
        </td>
        <td class="style3">
          <xsl:value-of select="length"/>
        </td>
        <td rowspan="6">
          <xsl:apply-templates select="view_bundle_iso"/>
        </td>
      </tr>
      <tr>
        <td  class="style2">
          <b>Largeur (mm):</b>
        </td>
        <td class="style3">
          <xsl:value-of select="width"/>
        </td>
      </tr>
      <tr>
        <td  class="style2">
          <b>Nombre de plats:</b>
        </td>
        <td class="style3">
          <xsl:value-of select="numberOfFlats"/>
        </td>
      </tr>
      <tr>
        <td  class="style2">
          <b>Epaisseur unitaire (mm):</b>
        </td>
        <td class="style3">
          <xsl:value-of select="unitThickness"/>
        </td>
      </tr>
      <tr>
        <td  class="style2">
          <b>Masse unitaire (kg):</b>
        </td>
        <td class="style3">
          <xsl:value-of select="unitWeight"/>
        </td>
      </tr>
      <tr>
        <td class="style3">
          <b>Epaisseur totale (mm)</b>
        </td>
        <td class="style3">
          <xsl:value-of select="totalThickness"/>
        </td>
      </tr>
      <tr>
        <td class="style3">
          <b>Masse totale (mm)</b>
        </td>
        <td class="style3">
          <xsl:value-of select="totalWeight"/>
        </td>
      </tr>
    </table>
  </xsl:template>
  <!-- #### CASE OF BOXES #### -->
  <xsl:template match="caseOfBoxes">
    <h3 style="font-familly:arial;color:blue;">Case of boxes</h3>
    <table class="style1" cellpadding="4">
      <tr>
        <td class="style2" colspan="1" width="25%">
          <b>Nom:</b>
        </td>
        <td class="style3" colspan="3" width="75%">
          <xsl:value-of select="name"/>
        </td>
      </tr>
      <tr>
        <td class="style2" colspan="1" width="25%">
          <b>Description:</b>
        </td>
        <td class="style3" colspan="3" width="75%">
          <xsl:value-of select="description"/>
        </td>
      </tr>
      <tr>
        <td class="style2" width="25%">
          <b>Longueur (mm):</b>
        </td>
        <td class="style3" width="25%">
          <xsl:value-of select="outerlength"/>
        </td>
        <td class="style2" width="25%">
          <b>Longueur intérieure (mm):</b>
        </td>
        <td class="style3" width="25%">
          <xsl:value-of select="innerLength"/>
        </td>
      </tr>
      <tr>
        <td class="style2"  width="25%">
          <b>Largeur (mm):</b>
        </td>
        <td class="style3"  width="25%">
          <xsl:value-of select="outerWidth"/>
        </td>
        <td class="style2"  width="25%">
          <b>Largeur intérieure (mm):</b>
        </td>
        <td class="style3"  width="25%">
          <xsl:value-of select="innerWidth"/>
        </td>
      </tr>
      <tr>
        <td class="style2"  width="25%">
          <b>Hauteur (mm):</b>
        </td>
        <td class="style3"  width="25%">
          <xsl:value-of select="outerHeight"/>
        </td>
        <td class="style2"  width="25%">
          <b>Hauteur intérieure (mm)</b>
        </td>
        <td class="style3"  width="25%">
          <xsl:value-of select="innerHeight"/>
        </td>
      </tr>
      <tr>
        <td class="style2"  width="25%">
          <b>Volume (l):</b>
        </td>
        <td class="style3"  width="25%">
          <xsl:value-of select="outerVolume"/>
        </td>
        <td class="style2">
          <b>Volume intérieur (l):</b>
        </td>
        <td class="style3">
          <xsl:value-of select="innerVolume"/>
        </td>
      </tr>
      <tr>
        <td class="style2">
          <b>Masse à vide (kg):</b>
        </td>
        <td class="style3">
          <xsl:value-of select="emptyWeight"/>
        </td>
        <td class="style2"  width="25%">
          <b>Masse (kg):</b>
        </td>
        <td class="style3"  width="25%">
          <xsl:value-of select="weight"/>
        </td>
      </tr>
      <tr>
        <td class="style2" width="25%">
          <b>Nombre de boîtes:</b>
        </td>
        <td class="style3" width="25%">
          <xsl:value-of select="numberOfBoxes"/>
        </td>
        <td class="style2" width="25%">
          <b>Disposition:</b>
        </td>
        <td class="style3"  width="25%">
          <xsl:value-of select="noX"/>*<xsl:value-of select="noY"/>*<xsl:value-of select="noZ"/>
        </td>
      </tr>
      <tr>
        <td class="style2" width="25%">
          <b>Dim0</b>
        </td>
        <td class="style3" width="25%">
          <xsl:value-of select="dim0"/>
        </td>
        <td class="style2" width="25%">
          <b>Dim1</b>
        </td>
        <td class="style3" width="25%">
          <xsl:value-of select="dim1"/>
        </td>
      </tr>
      <tr>
        <td colspan="2" width="50%">
          <xsl:apply-templates select="view_caseOfBoxes_iso1"/>
        </td>
        <td colspan="2" width="50%">
          <xsl:apply-templates select="view_caseOfBoxes_iso2"/>
        </td>
      </tr>
    </table>
  </xsl:template>
  <!--#### CONSTRAINT SET ####-->
  <xsl:template match="constraintSet">
    <h3 style="font-family:arial;color:blue;">Contraintes de palettisation</h3>
    <table class="style1">
      <tr>
        <td class="style2" width="20%">
          <b>Débord palette (mm):</b>
        </td>
        <td class="style2">
          <b>X</b>
        </td>
        <td class="style3">
          <xsl:value-of select="overhangX"/>
        </td>
        <td class="style2">
          <b>Y</b>
        </td>
        <td class="style3">
          <xsl:value-of select="overhangY"/>
        </td>
      </tr>
      <xsl:apply-templates select="maximumPalletWeightGroup">
      </xsl:apply-templates>
      <xsl:apply-templates select="maximumPalletHeightGroup">
      </xsl:apply-templates>
      <xsl:apply-templates select="maximumNumberOfItemsGroup">
      </xsl:apply-templates>
      <xsl:apply-templates select="admissibleLoadOnTopGroup">
      </xsl:apply-templates>
      <tr>
        <td class="style2">
          <b>Patrons de couche autorisés:</b>
        </td>
        <td class="style3" colspan="3">
          <xsl:value-of select="allowedPatterns"/>
        </td>
      </tr>
      <tr>
        <td class="style2">
          <b>Positions de caisse autorisées:</b>
        </td>
        <td class="style3" colspan="3">
          <xsl:value-of select="allowedOrthoAxis"/>
        </td>
      </tr>
      <tr>
        <td class="style2">
          <b>Autoriser l'alignement des couches:</b>
        </td>
        <td class="style3" colspan="3">
          <xsl:value-of select="allowAlignedLayers"/>
        </td>
      </tr>
      <tr>
        <td class="style2">
          <b>Autoriser l'alternance des couches:</b>
        </td>
        <td class="style3" colspan="3">
          <xsl:value-of select="allowAlternateLayers"/>
        </td>
      </tr>
      <xsl:apply-templates select="interlayerPeriodGroup">
      </xsl:apply-templates>
    </table>
  </xsl:template>
  <!--#### CASE OPTIM CONSTRAINT SET ####-->
  <xsl:template match="caseOptimConstraintSet">
    <h3 style="font-familly:arial;color:blue;">Case optimization constraint set</h3>
    <table class="style1" cellpadding="2">
      <tr>
        <td class="style2">
          <b>Epaisseur carton(mm):</b>
        </td>
        <td class="style3">
          <xsl:value-of select="wallThickness"/>
        </td>
      </tr>
      <tr>
        <td class="style2">
          <b>Limite caisse (min):</b>
        </td>
        <td class="style3">
          <xsl:value-of select="caseLimitMin"/>
        </td>
      </tr>
      <tr>
        <td class="style3">
          <b>Limite caisse (max):</b>
        </td>
        <td class="style3">
          <xsl:value-of select="caseLimitMax"/>
        </td>
      </tr>
    </table>
  </xsl:template>
  <!--#### PALLET SOLUTION ####-->
  <xsl:template match="palletSolution">
    <h3 style="font-family:arial;color:blue;">Solution sélectionnée</h3>
    <table class="style1">
      <tr>
        <td class="style2">
          <b>Titre:</b>
        </td>
        <td class="style3" colspan="3">
          <xsl:value-of select="title"/>
        </td>
      </tr>
      <tr>
        <td class="style2">
          <b>Nombre de caisses:</b>
        </td>
        <td class="style3" colspan="3">
          <xsl:value-of select="caseCount"/>
        </td>
      </tr>
      <tr>
        <td class="style2">
          <b>Nombre d'intercallaires:</b>
        </td>
        <td class="style3" colspan="3">
          <xsl:value-of select="interlayerCount"/>
        </td>
      </tr>
      <tr>
        <td class="style2">
          <b>Masse de la palette (kg):</b>
        </td>
        <td class="style3" colspan="3">
          <xsl:value-of select="palletWeight"/>
        </td>
      </tr>
      <tr>
        <td class="style2">
          <b>Hauteur de la palette (mm):</b>
        </td>
        <td class="style3" colspan="3">
          <xsl:value-of select="palletHeight"/>
        </td>
      </tr>
      <tr>
        <td class="style2">
          <b>Efficacité (%)</b>
        </td>
        <td class="style3" colspan="3">
          <xsl:value-of select="efficiency"/>
        </td>
      </tr>
      <tr>
        <td>
          <xsl:apply-templates select="view_palletsolution_front"/>
        </td>
        <td>
          <xsl:apply-templates select="view_palletsolution_left"/>
        </td>
        <td>
          <xsl:apply-templates select="view_palletsolution_right"/>
        </td>
        <td>
          <xsl:apply-templates select="view_palletsolution_back"/>
        </td>
      </tr>
      <tr>
        <td colspan="4">
          <xsl:apply-templates select="view_palletsolution_iso"/>
        </td>
      </tr>
    </table>
    <h3 style="font-family:arial;color:blue;">Couche(s)</h3>
    <table class="style1">
      <xsl:apply-templates select="layer"/>
    </table>
  </xsl:template>
  <!--CASE-->
  <xsl:template match="view_case_iso">
    <img src="images\view_case_iso.gif" width="150" height="150" align="middle"/>
  </xsl:template>
  <!--BOX-->
  <xsl:template match="view_box_iso">
    <img src="images\view_box_iso.gif" width="150" height="150" align="middle"/>
  </xsl:template>
  <!--PALLET-->
  <xsl:template match="view_pallet_iso">
    <img src="images\view_pallet_iso.gif" width="150" height="150" align="middle"/>
  </xsl:template>
  <!--INTERLAYER-->
  <xsl:template match="view_interlayer_iso">
    <img src="images\view_interlayer_iso.gif" width="150" height="150" align="middle"/>
  </xsl:template>
  <!--BUNDLE-->
  <xsl:template match="view_bundle_iso">
    <img src="images\view_interlayer_iso.gif" width="150" height="150" align="middle"/>
  </xsl:template>
  <!--PALLET SOLUTION-->
  <xsl:template match="view_palletsolution_front">
    <img src="images\view_palletsolution_front.gif" width="150" height="150" align="middle"/>
  </xsl:template>
  <xsl:template match="view_palletsolution_left">
    <img src="images\view_palletsolution_left.gif" width="150" height="150" align="middle"/>
  </xsl:template>
  <xsl:template match="view_palletsolution_right">
    <img src="images\view_palletsolution_right.gif" width="150" height="150" align="middle"/>
  </xsl:template>
  <xsl:template match="view_palletsolution_back">
    <img src="images\view_palletsolution_back.gif" width="150" height="150" align="middle"/>
  </xsl:template>
  <xsl:template match="view_palletsolution_iso">
    <img src="images\view_palletsolution_iso.gif" width="450" height="450" align="middle"/>
  </xsl:template>
  <!--CASE OF BOXES-->
  <xsl:template match="view_caseOfBoxes_iso1">
    <img src="images\view_caseOfBoxes_iso1.gif" width="150" height="150" align="middle"/>
  </xsl:template>
  <xsl:template match="view_caseOfBoxes_iso2">
    <img src="images\view_caseOfBoxes_iso2.gif" width="150" height="150" align="middle"/>
  </xsl:template>
  <xsl:template match="view_truck_iso">
    <img src="images\view_truck_iso.gif" width="150" height="150" align="middle"/>
  </xsl:template>
  <xsl:template match="view_trucksolution_top">
    <img src="images\view_trucksolution_top.gif" width="450" height="450" align="middle"/>
  </xsl:template>
  <xsl:template match="view_trucksolution_iso">
    <img src="images\view_trucksolution_iso.gif" width="450" height="450" align="middle"/>
  </xsl:template>
  <!--STOP STACKING CONDITIONS-->
  <xsl:template match="maximumPalletWeightGroup">
    <tr>
      <td class="style2">
        <b>Masse de palette maximale (kg):</b>
      </td>
      <td class="style3" colspan="3">
        <xsl:value-of select="maximumPalletWeight"/>
      </td>
    </tr>
  </xsl:template>
  <xsl:template match="maximumPalletHeightGroup">
    <tr>
      <td class="style2">
        <b>Hauteur de palette maximale (kg):</b>
      </td>
      <td class="style3" colspan="3">
        <xsl:value-of select="maximumPalletHeight"/>
      </td>
    </tr>
  </xsl:template>
  <xsl:template match="maximumNumberOfItemsGroup">
    <tr>
      <td class="style2">
        <b>Nombre de caisse maximal</b>
      </td>
      <td class="style3" colspan="3">
        <xsl:value-of select="maximumNumberOfItems"/>
      </td>
    </tr>
  </xsl:template>
  <xsl:template match="admissibleLoadOnTopGroup">
    <tr>
      <td class="style2">
        <b>Chargement sur caisse maximal (kg)</b>
      </td>
      <td class="style3" colspan="3">
        <xsl:value-of select="admissibleLoadOnTop"/>
      </td>
    </tr>
  </xsl:template>
  <!--INTERLAYER PERIOD-->
  <xsl:template match="interlayerPeriodGroup">
    <tr>
      <td class="style2">
        <b>Période intercallaire (toutes les X couches)</b>
      </td>
      <td class="style3" colspan="3">
        <xsl:value-of select="interlayerPeriod"/>
      </td>
    </tr>
  </xsl:template>
  <!--LAYER-->
  <xsl:template match="layer">
    <tr>
      <td class="style2">
        <xsl:value-of select="layerId"/>
      </td>
      <td class="style3">
        <xsl:value-of select="layerBoxCount"/>
      </td>
      <td>
        <img src="images\layerImage1.gif" width="150" height="150"/>
      </td>
    </tr>
  </xsl:template>
  <!--TRUCK-->
  <xsl:template match="truck">
    <table class="style1" cellpadding="3">
      <tr>
        <td class="style2">
          <b>Nom:</b>
        </td>
        <td class="style3" colspan="2">
          <xsl:value-of select="name"/>
        </td>
      </tr>
      <tr>
        <td class="style2">
          <b>Description:</b>
        </td>
        <td class="style3" colspan="2">
          <xsl:value-of select="description"/>
        </td>
      </tr>
      <tr>
        <td class="style2">
          <b>Longueur (mm):</b>          
        </td>
        <td class="style3">
          <xsl:value-of select="length"/>
        </td>
        <td rowspan="4">
          <xsl:apply-templates select="view_truck_iso"/>
        </td>
      </tr>
      <tr>
        <td class="style2">
          <b>Largeur (mm):</b>
        </td>
        <td class="style3">
          <xsl:value-of select="width"/>
        </td>
      </tr>
      <tr>
        <td class="style2">
          <b>Hauteur (mm):</b>
        </td>
        <td class="style3">
          <xsl:value-of select="height"/>
        </td>
      </tr>
      <tr>
        <td class="style2">
          <b>Charge admissible (kg):</b>
        </td>
        <td class="style3">
          <xsl:value-of select="admissibleLoad"/>
        </td>        
      </tr>
    </table>
  </xsl:template>
  <!--TRUCK SOLUTION-->
  <xsl:template match="truckSolution">
    <h3 style="font-familly:arial;color:blue;">Solution sélectionnée</h3>
    <table class="style1" cellpadding="2">
      <tr>
        <td class="style2" width="50%">
          <b>Titre</b>
        </td>
        <td class="style3" width="50%">
          <xsl:value-of select="title"/>
        </td>
      </tr>
      <tr>
        <td class="style2" width="50%">
          <b>Nombre de palettes:</b>
        </td>
        <td class="style3" width="50%">
          <xsl:value-of select="palletCount"/>
        </td>
      </tr>
      <tr>
        <td class="style2" width="50%">
          <b>Nombre de caisses:</b>          
        </td>
        <td class="style3" width="50%">
          <xsl:value-of select="caseCount"/>
        </td>
      </tr>
      <tr>
        <td class="style2" width="50%">
          <b>Masse du chargement (kg):</b>
        </td>
        <td class="style3" width="50%">
          <xsl:value-of select="loadWeight"/>
        </td>        
      </tr>
      <tr>
        <td class="style2" width="50%">
          <b>Efficacité en masse (%):</b>
        </td>
        <td class="style3" width="50%">
          <xsl:value-of select="loadEfficiency"/>
        </td>
      </tr>
      <tr>
        <td class="style2" width="50%">
          <b>Efficacité en volume (%):</b>
        </td>
        <td class="style3" width="50%">
          <xsl:value-of select="volumeEfficiency"/>
        </td>
      </tr>
      <tr>
        <td colspan="2">
          <xsl:apply-templates select="view_trucksolution_top"></xsl:apply-templates>
        </td>
      </tr>
      <tr>
        <td colspan="2">
          <xsl:apply-templates select="view_trucksolution_iso"></xsl:apply-templates>
        </td>
      </tr>
    </table>
  </xsl:template>
</xsl:stylesheet>