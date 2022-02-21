( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b735 - block
    b241 - block
    b150 - block
    b885 - block
    b865 - block
    b314 - block
    b230 - block
    b938 - block
    b672 - block
    b289 - block
    b750 - block
    b630 - block
    b494 - block
    b366 - block
    b770 - block
    b746 - block
    b965 - block
    b944 - block
    b612 - block
    b184 - block
    b564 - block
    b86 - block
    b487 - block
    b468 - block
    b883 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b735 )
    ( on b241 b735 )
    ( on b150 b241 )
    ( on b885 b150 )
    ( on b865 b885 )
    ( on b314 b865 )
    ( on b230 b314 )
    ( on b938 b230 )
    ( on b672 b938 )
    ( on b289 b672 )
    ( on b750 b289 )
    ( on b630 b750 )
    ( on b494 b630 )
    ( on b366 b494 )
    ( on b770 b366 )
    ( on b746 b770 )
    ( on b965 b746 )
    ( on b944 b965 )
    ( on b612 b944 )
    ( on b184 b612 )
    ( on b564 b184 )
    ( on b86 b564 )
    ( on b487 b86 )
    ( on b468 b487 )
    ( on b883 b468 )
    ( clear b883 )
  )
  ( :goal
    ( and
      ( clear b735 )
    )
  )
)
