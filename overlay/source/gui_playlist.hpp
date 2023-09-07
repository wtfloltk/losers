#pragma once

#include </mnt/c/Users/carel/Downloads/sys-tune-master-128bitsound/sys-tune-master/libtesla/include/tesla.hpp>

class PlaylistGui final : public tsl::Gui {
  private:
    tsl::elm::List *m_list;

  public:
    PlaylistGui();

    tsl::elm::Element *createUI() override;
};
