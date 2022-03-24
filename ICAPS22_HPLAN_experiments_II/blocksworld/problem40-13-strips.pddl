( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b17 - block
    b886 - block
    b218 - block
    b583 - block
    b658 - block
    b332 - block
    b455 - block
    b847 - block
    b248 - block
    b887 - block
    b831 - block
    b626 - block
    b849 - block
    b965 - block
    b795 - block
    b121 - block
    b521 - block
    b789 - block
    b798 - block
    b837 - block
    b113 - block
    b566 - block
    b842 - block
    b16 - block
    b570 - block
    b445 - block
    b253 - block
    b334 - block
    b769 - block
    b180 - block
    b865 - block
    b543 - block
    b890 - block
    b35 - block
    b239 - block
    b819 - block
    b240 - block
    b800 - block
    b850 - block
    b646 - block
    b612 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b17 )
    ( on b886 b17 )
    ( on b218 b886 )
    ( on b583 b218 )
    ( on b658 b583 )
    ( on b332 b658 )
    ( on b455 b332 )
    ( on b847 b455 )
    ( on b248 b847 )
    ( on b887 b248 )
    ( on b831 b887 )
    ( on b626 b831 )
    ( on b849 b626 )
    ( on b965 b849 )
    ( on b795 b965 )
    ( on b121 b795 )
    ( on b521 b121 )
    ( on b789 b521 )
    ( on b798 b789 )
    ( on b837 b798 )
    ( on b113 b837 )
    ( on b566 b113 )
    ( on b842 b566 )
    ( on b16 b842 )
    ( on b570 b16 )
    ( on b445 b570 )
    ( on b253 b445 )
    ( on b334 b253 )
    ( on b769 b334 )
    ( on b180 b769 )
    ( on b865 b180 )
    ( on b543 b865 )
    ( on b890 b543 )
    ( on b35 b890 )
    ( on b239 b35 )
    ( on b819 b239 )
    ( on b240 b819 )
    ( on b800 b240 )
    ( on b850 b800 )
    ( on b646 b850 )
    ( on b612 b646 )
    ( clear b612 )
  )
  ( :goal
    ( and
      ( clear b17 )
    )
  )
)
