( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b995 - block
    b553 - block
    b862 - block
    b551 - block
    b839 - block
    b619 - block
    b731 - block
    b487 - block
    b87 - block
    b852 - block
    b413 - block
    b403 - block
    b61 - block
    b878 - block
    b868 - block
    b562 - block
    b796 - block
    b197 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b995 )
    ( on b553 b995 )
    ( on b862 b553 )
    ( on b551 b862 )
    ( on b839 b551 )
    ( on b619 b839 )
    ( on b731 b619 )
    ( on b487 b731 )
    ( on b87 b487 )
    ( on b852 b87 )
    ( on b413 b852 )
    ( on b403 b413 )
    ( on b61 b403 )
    ( on b878 b61 )
    ( on b868 b878 )
    ( on b562 b868 )
    ( on b796 b562 )
    ( on b197 b796 )
    ( clear b197 )
  )
  ( :goal
    ( and
      ( clear b995 )
    )
  )
)
