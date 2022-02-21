( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b299 - block
    b252 - block
    b935 - block
    b161 - block
    b721 - block
    b88 - block
    b887 - block
    b65 - block
    b436 - block
    b247 - block
    b497 - block
    b267 - block
    b385 - block
    b999 - block
    b459 - block
    b61 - block
    b318 - block
    b755 - block
    b259 - block
    b584 - block
    b356 - block
    b63 - block
    b791 - block
    b614 - block
    b678 - block
    b327 - block
    b289 - block
    b931 - block
    b516 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b299 )
    ( on b252 b299 )
    ( on b935 b252 )
    ( on b161 b935 )
    ( on b721 b161 )
    ( on b88 b721 )
    ( on b887 b88 )
    ( on b65 b887 )
    ( on b436 b65 )
    ( on b247 b436 )
    ( on b497 b247 )
    ( on b267 b497 )
    ( on b385 b267 )
    ( on b999 b385 )
    ( on b459 b999 )
    ( on b61 b459 )
    ( on b318 b61 )
    ( on b755 b318 )
    ( on b259 b755 )
    ( on b584 b259 )
    ( on b356 b584 )
    ( on b63 b356 )
    ( on b791 b63 )
    ( on b614 b791 )
    ( on b678 b614 )
    ( on b327 b678 )
    ( on b289 b327 )
    ( on b931 b289 )
    ( on b516 b931 )
    ( clear b516 )
  )
  ( :goal
    ( and
      ( clear b299 )
    )
  )
)
