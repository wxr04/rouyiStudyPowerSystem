package com.ruoyi.analysis.domain;

import java.util.ArrayList;

public class EnergyAnalysis  {
 String devName;
 ArrayList<Float> energyData;
 float totalEnergy=0;

    public float getTotalEnergy() {
        return totalEnergy;
    }

    public void setTotalEnergy(float totalEnergy) {
        this.totalEnergy = totalEnergy;
    }

    public String getDevName() {
        return devName;
    }

    public void setDevName(String devName) {
        this.devName = devName;
    }

    public ArrayList<Float> getEnergyData() {
        return energyData;
    }

    public void setEnergyData(ArrayList<Float> energyData) {
        this.energyData = energyData;
    }



}
