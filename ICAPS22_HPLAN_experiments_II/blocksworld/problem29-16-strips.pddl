( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b244 - block
    b859 - block
    b592 - block
    b837 - block
    b778 - block
    b996 - block
    b8 - block
    b72 - block
    b79 - block
    b942 - block
    b616 - block
    b938 - block
    b664 - block
    b43 - block
    b240 - block
    b743 - block
    b257 - block
    b925 - block
    b720 - block
    b450 - block
    b606 - block
    b658 - block
    b109 - block
    b537 - block
    b495 - block
    b42 - block
    b891 - block
    b965 - block
    b404 - block
    b584 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b244 )
    ( on b859 b244 )
    ( on b592 b859 )
    ( on b837 b592 )
    ( on b778 b837 )
    ( on b996 b778 )
    ( on b8 b996 )
    ( on b72 b8 )
    ( on b79 b72 )
    ( on b942 b79 )
    ( on b616 b942 )
    ( on b938 b616 )
    ( on b664 b938 )
    ( on b43 b664 )
    ( on b240 b43 )
    ( on b743 b240 )
    ( on b257 b743 )
    ( on b925 b257 )
    ( on b720 b925 )
    ( on b450 b720 )
    ( on b606 b450 )
    ( on b658 b606 )
    ( on b109 b658 )
    ( on b537 b109 )
    ( on b495 b537 )
    ( on b42 b495 )
    ( on b891 b42 )
    ( on b965 b891 )
    ( on b404 b965 )
    ( on b584 b404 )
    ( clear b584 )
  )
  ( :goal
    ( and
      ( clear b244 )
    )
  )
)
