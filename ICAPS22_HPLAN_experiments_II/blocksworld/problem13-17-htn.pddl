( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b822 - block
    b190 - block
    b292 - block
    b31 - block
    b733 - block
    b734 - block
    b208 - block
    b76 - block
    b984 - block
    b893 - block
    b206 - block
    b815 - block
    b752 - block
    b487 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b822 )
    ( on b190 b822 )
    ( on b292 b190 )
    ( on b31 b292 )
    ( on b733 b31 )
    ( on b734 b733 )
    ( on b208 b734 )
    ( on b76 b208 )
    ( on b984 b76 )
    ( on b893 b984 )
    ( on b206 b893 )
    ( on b815 b206 )
    ( on b752 b815 )
    ( on b487 b752 )
    ( clear b487 )
  )
  ( :tasks
    ( Make-13Pile b190 b292 b31 b733 b734 b208 b76 b984 b893 b206 b815 b752 b487 )
  )
)
