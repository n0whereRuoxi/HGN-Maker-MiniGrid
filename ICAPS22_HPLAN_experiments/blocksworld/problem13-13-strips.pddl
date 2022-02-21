( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b201 - block
    b606 - block
    b527 - block
    b373 - block
    b192 - block
    b235 - block
    b885 - block
    b181 - block
    b404 - block
    b320 - block
    b391 - block
    b3 - block
    b877 - block
    b545 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b201 )
    ( on b606 b201 )
    ( on b527 b606 )
    ( on b373 b527 )
    ( on b192 b373 )
    ( on b235 b192 )
    ( on b885 b235 )
    ( on b181 b885 )
    ( on b404 b181 )
    ( on b320 b404 )
    ( on b391 b320 )
    ( on b3 b391 )
    ( on b877 b3 )
    ( on b545 b877 )
    ( clear b545 )
  )
  ( :goal
    ( and
      ( clear b201 )
    )
  )
)
