( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b682 - block
    b320 - block
    b886 - block
    b894 - block
    b723 - block
    b476 - block
    b322 - block
    b818 - block
    b188 - block
    b66 - block
    b831 - block
    b548 - block
    b515 - block
    b60 - block
    b158 - block
    b170 - block
    b460 - block
    b745 - block
    b281 - block
    b112 - block
    b396 - block
    b675 - block
    b58 - block
    b125 - block
    b270 - block
    b703 - block
    b311 - block
    b835 - block
    b38 - block
    b360 - block
    b746 - block
    b215 - block
    b979 - block
    b664 - block
    b543 - block
    b223 - block
    b169 - block
    b249 - block
    b72 - block
    b944 - block
    b755 - block
    b372 - block
    b693 - block
    b450 - block
    b243 - block
    b18 - block
    b950 - block
    b868 - block
    b502 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b682 )
    ( on b320 b682 )
    ( on b886 b320 )
    ( on b894 b886 )
    ( on b723 b894 )
    ( on b476 b723 )
    ( on b322 b476 )
    ( on b818 b322 )
    ( on b188 b818 )
    ( on b66 b188 )
    ( on b831 b66 )
    ( on b548 b831 )
    ( on b515 b548 )
    ( on b60 b515 )
    ( on b158 b60 )
    ( on b170 b158 )
    ( on b460 b170 )
    ( on b745 b460 )
    ( on b281 b745 )
    ( on b112 b281 )
    ( on b396 b112 )
    ( on b675 b396 )
    ( on b58 b675 )
    ( on b125 b58 )
    ( on b270 b125 )
    ( on b703 b270 )
    ( on b311 b703 )
    ( on b835 b311 )
    ( on b38 b835 )
    ( on b360 b38 )
    ( on b746 b360 )
    ( on b215 b746 )
    ( on b979 b215 )
    ( on b664 b979 )
    ( on b543 b664 )
    ( on b223 b543 )
    ( on b169 b223 )
    ( on b249 b169 )
    ( on b72 b249 )
    ( on b944 b72 )
    ( on b755 b944 )
    ( on b372 b755 )
    ( on b693 b372 )
    ( on b450 b693 )
    ( on b243 b450 )
    ( on b18 b243 )
    ( on b950 b18 )
    ( on b868 b950 )
    ( on b502 b868 )
    ( clear b502 )
  )
  ( :goal
    ( and
      ( clear b682 )
    )
  )
)
