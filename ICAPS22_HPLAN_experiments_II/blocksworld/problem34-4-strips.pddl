( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b8 - block
    b979 - block
    b931 - block
    b92 - block
    b728 - block
    b528 - block
    b166 - block
    b49 - block
    b1 - block
    b589 - block
    b373 - block
    b27 - block
    b138 - block
    b767 - block
    b359 - block
    b40 - block
    b815 - block
    b874 - block
    b16 - block
    b783 - block
    b146 - block
    b24 - block
    b806 - block
    b714 - block
    b313 - block
    b211 - block
    b134 - block
    b367 - block
    b52 - block
    b436 - block
    b490 - block
    b480 - block
    b402 - block
    b422 - block
    b730 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b8 )
    ( on b979 b8 )
    ( on b931 b979 )
    ( on b92 b931 )
    ( on b728 b92 )
    ( on b528 b728 )
    ( on b166 b528 )
    ( on b49 b166 )
    ( on b1 b49 )
    ( on b589 b1 )
    ( on b373 b589 )
    ( on b27 b373 )
    ( on b138 b27 )
    ( on b767 b138 )
    ( on b359 b767 )
    ( on b40 b359 )
    ( on b815 b40 )
    ( on b874 b815 )
    ( on b16 b874 )
    ( on b783 b16 )
    ( on b146 b783 )
    ( on b24 b146 )
    ( on b806 b24 )
    ( on b714 b806 )
    ( on b313 b714 )
    ( on b211 b313 )
    ( on b134 b211 )
    ( on b367 b134 )
    ( on b52 b367 )
    ( on b436 b52 )
    ( on b490 b436 )
    ( on b480 b490 )
    ( on b402 b480 )
    ( on b422 b402 )
    ( on b730 b422 )
    ( clear b730 )
  )
  ( :goal
    ( and
      ( clear b8 )
    )
  )
)
