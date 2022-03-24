( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b314 - block
    b941 - block
    b704 - block
    b539 - block
    b720 - block
    b843 - block
    b48 - block
    b694 - block
    b653 - block
    b927 - block
    b251 - block
    b767 - block
    b588 - block
    b566 - block
    b174 - block
    b701 - block
    b423 - block
    b282 - block
    b155 - block
    b560 - block
    b618 - block
    b170 - block
    b430 - block
    b592 - block
    b810 - block
    b272 - block
    b837 - block
    b491 - block
    b300 - block
    b833 - block
    b205 - block
    b798 - block
    b49 - block
    b984 - block
    b328 - block
    b149 - block
    b608 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b314 )
    ( on b941 b314 )
    ( on b704 b941 )
    ( on b539 b704 )
    ( on b720 b539 )
    ( on b843 b720 )
    ( on b48 b843 )
    ( on b694 b48 )
    ( on b653 b694 )
    ( on b927 b653 )
    ( on b251 b927 )
    ( on b767 b251 )
    ( on b588 b767 )
    ( on b566 b588 )
    ( on b174 b566 )
    ( on b701 b174 )
    ( on b423 b701 )
    ( on b282 b423 )
    ( on b155 b282 )
    ( on b560 b155 )
    ( on b618 b560 )
    ( on b170 b618 )
    ( on b430 b170 )
    ( on b592 b430 )
    ( on b810 b592 )
    ( on b272 b810 )
    ( on b837 b272 )
    ( on b491 b837 )
    ( on b300 b491 )
    ( on b833 b300 )
    ( on b205 b833 )
    ( on b798 b205 )
    ( on b49 b798 )
    ( on b984 b49 )
    ( on b328 b984 )
    ( on b149 b328 )
    ( on b608 b149 )
    ( clear b608 )
  )
  ( :goal
    ( and
      ( clear b314 )
    )
  )
)
