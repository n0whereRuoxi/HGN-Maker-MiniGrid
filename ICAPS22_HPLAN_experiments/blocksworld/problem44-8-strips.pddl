( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b191 - block
    b534 - block
    b233 - block
    b912 - block
    b450 - block
    b133 - block
    b499 - block
    b656 - block
    b284 - block
    b292 - block
    b806 - block
    b927 - block
    b535 - block
    b474 - block
    b178 - block
    b508 - block
    b559 - block
    b451 - block
    b239 - block
    b800 - block
    b118 - block
    b716 - block
    b940 - block
    b809 - block
    b325 - block
    b164 - block
    b327 - block
    b9 - block
    b236 - block
    b353 - block
    b335 - block
    b727 - block
    b82 - block
    b225 - block
    b589 - block
    b209 - block
    b107 - block
    b338 - block
    b699 - block
    b241 - block
    b930 - block
    b283 - block
    b457 - block
    b785 - block
    b998 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b191 )
    ( on b534 b191 )
    ( on b233 b534 )
    ( on b912 b233 )
    ( on b450 b912 )
    ( on b133 b450 )
    ( on b499 b133 )
    ( on b656 b499 )
    ( on b284 b656 )
    ( on b292 b284 )
    ( on b806 b292 )
    ( on b927 b806 )
    ( on b535 b927 )
    ( on b474 b535 )
    ( on b178 b474 )
    ( on b508 b178 )
    ( on b559 b508 )
    ( on b451 b559 )
    ( on b239 b451 )
    ( on b800 b239 )
    ( on b118 b800 )
    ( on b716 b118 )
    ( on b940 b716 )
    ( on b809 b940 )
    ( on b325 b809 )
    ( on b164 b325 )
    ( on b327 b164 )
    ( on b9 b327 )
    ( on b236 b9 )
    ( on b353 b236 )
    ( on b335 b353 )
    ( on b727 b335 )
    ( on b82 b727 )
    ( on b225 b82 )
    ( on b589 b225 )
    ( on b209 b589 )
    ( on b107 b209 )
    ( on b338 b107 )
    ( on b699 b338 )
    ( on b241 b699 )
    ( on b930 b241 )
    ( on b283 b930 )
    ( on b457 b283 )
    ( on b785 b457 )
    ( on b998 b785 )
    ( clear b998 )
  )
  ( :goal
    ( and
      ( clear b191 )
    )
  )
)
