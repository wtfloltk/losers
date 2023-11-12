#pragma once

#include "tune.h"
#include "elm_status_bar.hpp"

#include </mnt/c/Users/carel/Downloads/sys-tune-master-128bitsound/sys-tune-master/libtesla/include/tesla.hpp>

class MainGui final : public tsl::Gui {
  private:
    StatusBar *m_status_bar;

  public:
    MainGui();

    tsl::elm::Element *createUI() final;

    void update() final;
};
