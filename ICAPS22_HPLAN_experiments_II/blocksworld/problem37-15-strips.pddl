( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b269 - block
    b446 - block
    b709 - block
    b762 - block
    b228 - block
    b688 - block
    b184 - block
    b934 - block
    b860 - block
    b287 - block
    b744 - block
    b671 - block
    b382 - block
    b580 - block
    b296 - block
    b509 - block
    b232 - block
    b494 - block
    b498 - block
    b470 - block
    b786 - block
    b803 - block
    b59 - block
    b820 - block
    b905 - block
    b693 - block
    b9 - block
    b267 - block
    b656 - block
    b787 - block
    b216 - block
    b413 - block
    b66 - block
    b335 - block
    b91 - block
    b613 - block
    b811 - block
    b441 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b269 )
    ( on b446 b269 )
    ( on b709 b446 )
    ( on b762 b709 )
    ( on b228 b762 )
    ( on b688 b228 )
    ( on b184 b688 )
    ( on b934 b184 )
    ( on b860 b934 )
    ( on b287 b860 )
    ( on b744 b287 )
    ( on b671 b744 )
    ( on b382 b671 )
    ( on b580 b382 )
    ( on b296 b580 )
    ( on b509 b296 )
    ( on b232 b509 )
    ( on b494 b232 )
    ( on b498 b494 )
    ( on b470 b498 )
    ( on b786 b470 )
    ( on b803 b786 )
    ( on b59 b803 )
    ( on b820 b59 )
    ( on b905 b820 )
    ( on b693 b905 )
    ( on b9 b693 )
    ( on b267 b9 )
    ( on b656 b267 )
    ( on b787 b656 )
    ( on b216 b787 )
    ( on b413 b216 )
    ( on b66 b413 )
    ( on b335 b66 )
    ( on b91 b335 )
    ( on b613 b91 )
    ( on b811 b613 )
    ( on b441 b811 )
    ( clear b441 )
  )
  ( :goal
    ( and
      ( clear b269 )
    )
  )
)
