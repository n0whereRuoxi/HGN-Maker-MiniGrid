( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b744 - block
    b747 - block
    b631 - block
    b727 - block
    b472 - block
    b304 - block
    b241 - block
    b535 - block
    b531 - block
    b743 - block
    b609 - block
    b31 - block
    b861 - block
    b502 - block
    b384 - block
    b584 - block
    b452 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b744 )
    ( on b747 b744 )
    ( on b631 b747 )
    ( on b727 b631 )
    ( on b472 b727 )
    ( on b304 b472 )
    ( on b241 b304 )
    ( on b535 b241 )
    ( on b531 b535 )
    ( on b743 b531 )
    ( on b609 b743 )
    ( on b31 b609 )
    ( on b861 b31 )
    ( on b502 b861 )
    ( on b384 b502 )
    ( on b584 b384 )
    ( on b452 b584 )
    ( clear b452 )
  )
  ( :goal
    ( and
      ( clear b744 )
    )
  )
)
