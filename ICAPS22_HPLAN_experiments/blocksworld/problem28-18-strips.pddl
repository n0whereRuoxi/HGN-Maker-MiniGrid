( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b343 - block
    b174 - block
    b585 - block
    b236 - block
    b221 - block
    b287 - block
    b958 - block
    b467 - block
    b92 - block
    b356 - block
    b852 - block
    b237 - block
    b249 - block
    b720 - block
    b798 - block
    b732 - block
    b645 - block
    b542 - block
    b800 - block
    b168 - block
    b756 - block
    b709 - block
    b303 - block
    b950 - block
    b456 - block
    b500 - block
    b131 - block
    b97 - block
    b321 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b343 )
    ( on b174 b343 )
    ( on b585 b174 )
    ( on b236 b585 )
    ( on b221 b236 )
    ( on b287 b221 )
    ( on b958 b287 )
    ( on b467 b958 )
    ( on b92 b467 )
    ( on b356 b92 )
    ( on b852 b356 )
    ( on b237 b852 )
    ( on b249 b237 )
    ( on b720 b249 )
    ( on b798 b720 )
    ( on b732 b798 )
    ( on b645 b732 )
    ( on b542 b645 )
    ( on b800 b542 )
    ( on b168 b800 )
    ( on b756 b168 )
    ( on b709 b756 )
    ( on b303 b709 )
    ( on b950 b303 )
    ( on b456 b950 )
    ( on b500 b456 )
    ( on b131 b500 )
    ( on b97 b131 )
    ( on b321 b97 )
    ( clear b321 )
  )
  ( :goal
    ( and
      ( clear b343 )
    )
  )
)
