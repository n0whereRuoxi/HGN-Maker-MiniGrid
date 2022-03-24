( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b38 - block
    b275 - block
    b923 - block
    b903 - block
    b26 - block
    b236 - block
    b414 - block
    b406 - block
    b671 - block
    b30 - block
    b509 - block
    b999 - block
    b888 - block
    b655 - block
    b188 - block
    b937 - block
    b693 - block
    b845 - block
    b545 - block
    b591 - block
    b288 - block
    b396 - block
    b76 - block
    b955 - block
    b409 - block
    b270 - block
    b818 - block
    b740 - block
    b40 - block
    b309 - block
    b371 - block
    b584 - block
    b426 - block
    b856 - block
    b729 - block
    b610 - block
    b232 - block
    b708 - block
    b904 - block
    b415 - block
    b798 - block
    b37 - block
    b51 - block
    b835 - block
    b277 - block
    b386 - block
    b535 - block
    b703 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b38 )
    ( on b275 b38 )
    ( on b923 b275 )
    ( on b903 b923 )
    ( on b26 b903 )
    ( on b236 b26 )
    ( on b414 b236 )
    ( on b406 b414 )
    ( on b671 b406 )
    ( on b30 b671 )
    ( on b509 b30 )
    ( on b999 b509 )
    ( on b888 b999 )
    ( on b655 b888 )
    ( on b188 b655 )
    ( on b937 b188 )
    ( on b693 b937 )
    ( on b845 b693 )
    ( on b545 b845 )
    ( on b591 b545 )
    ( on b288 b591 )
    ( on b396 b288 )
    ( on b76 b396 )
    ( on b955 b76 )
    ( on b409 b955 )
    ( on b270 b409 )
    ( on b818 b270 )
    ( on b740 b818 )
    ( on b40 b740 )
    ( on b309 b40 )
    ( on b371 b309 )
    ( on b584 b371 )
    ( on b426 b584 )
    ( on b856 b426 )
    ( on b729 b856 )
    ( on b610 b729 )
    ( on b232 b610 )
    ( on b708 b232 )
    ( on b904 b708 )
    ( on b415 b904 )
    ( on b798 b415 )
    ( on b37 b798 )
    ( on b51 b37 )
    ( on b835 b51 )
    ( on b277 b835 )
    ( on b386 b277 )
    ( on b535 b386 )
    ( on b703 b535 )
    ( clear b703 )
  )
  ( :goal
    ( and
      ( clear b38 )
    )
  )
)
