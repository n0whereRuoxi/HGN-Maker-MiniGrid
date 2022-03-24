( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b201 - block
    b115 - block
    b640 - block
    b837 - block
    b241 - block
    b583 - block
    b164 - block
    b931 - block
    b543 - block
    b562 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b201 )
    ( on b115 b201 )
    ( on b640 b115 )
    ( on b837 b640 )
    ( on b241 b837 )
    ( on b583 b241 )
    ( on b164 b583 )
    ( on b931 b164 )
    ( on b543 b931 )
    ( on b562 b543 )
    ( clear b562 )
  )
  ( :goal
    ( and
      ( clear b201 )
    )
  )
)
