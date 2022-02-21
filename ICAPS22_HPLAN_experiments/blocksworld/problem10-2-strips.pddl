( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b269 - block
    b797 - block
    b803 - block
    b371 - block
    b823 - block
    b902 - block
    b879 - block
    b728 - block
    b216 - block
    b556 - block
    b644 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b269 )
    ( on b797 b269 )
    ( on b803 b797 )
    ( on b371 b803 )
    ( on b823 b371 )
    ( on b902 b823 )
    ( on b879 b902 )
    ( on b728 b879 )
    ( on b216 b728 )
    ( on b556 b216 )
    ( on b644 b556 )
    ( clear b644 )
  )
  ( :goal
    ( and
      ( clear b269 )
    )
  )
)
