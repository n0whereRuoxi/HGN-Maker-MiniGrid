( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b212 - block
    b160 - block
    b586 - block
    b471 - block
    b445 - block
    b730 - block
    b802 - block
    b496 - block
    b636 - block
    b296 - block
    b327 - block
    b794 - block
    b221 - block
    b931 - block
    b260 - block
    b947 - block
    b854 - block
    b351 - block
    b379 - block
    b873 - block
    b564 - block
    b15 - block
    b333 - block
    b874 - block
    b489 - block
    b410 - block
    b396 - block
    b325 - block
    b726 - block
    b300 - block
    b921 - block
    b883 - block
    b97 - block
    b760 - block
    b136 - block
    b623 - block
    b904 - block
    b467 - block
    b916 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b212 )
    ( on b160 b212 )
    ( on b586 b160 )
    ( on b471 b586 )
    ( on b445 b471 )
    ( on b730 b445 )
    ( on b802 b730 )
    ( on b496 b802 )
    ( on b636 b496 )
    ( on b296 b636 )
    ( on b327 b296 )
    ( on b794 b327 )
    ( on b221 b794 )
    ( on b931 b221 )
    ( on b260 b931 )
    ( on b947 b260 )
    ( on b854 b947 )
    ( on b351 b854 )
    ( on b379 b351 )
    ( on b873 b379 )
    ( on b564 b873 )
    ( on b15 b564 )
    ( on b333 b15 )
    ( on b874 b333 )
    ( on b489 b874 )
    ( on b410 b489 )
    ( on b396 b410 )
    ( on b325 b396 )
    ( on b726 b325 )
    ( on b300 b726 )
    ( on b921 b300 )
    ( on b883 b921 )
    ( on b97 b883 )
    ( on b760 b97 )
    ( on b136 b760 )
    ( on b623 b136 )
    ( on b904 b623 )
    ( on b467 b904 )
    ( on b916 b467 )
    ( clear b916 )
  )
  ( :goal
    ( and
      ( clear b212 )
    )
  )
)
