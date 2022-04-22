( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b307 - block
    b407 - block
    b466 - block
    b303 - block
    b658 - block
    b221 - block
    b573 - block
    b871 - block
    b958 - block
    b472 - block
    b739 - block
    b335 - block
    b98 - block
    b846 - block
    b68 - block
    b54 - block
    b674 - block
    b178 - block
    b930 - block
    b954 - block
    b16 - block
    b140 - block
    b74 - block
    b214 - block
    b111 - block
    b719 - block
    b103 - block
    b600 - block
    b959 - block
    b824 - block
    b188 - block
    b453 - block
    b256 - block
    b75 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b307 )
    ( on b407 b307 )
    ( on b466 b407 )
    ( on b303 b466 )
    ( on b658 b303 )
    ( on b221 b658 )
    ( on b573 b221 )
    ( on b871 b573 )
    ( on b958 b871 )
    ( on b472 b958 )
    ( on b739 b472 )
    ( on b335 b739 )
    ( on b98 b335 )
    ( on b846 b98 )
    ( on b68 b846 )
    ( on b54 b68 )
    ( on b674 b54 )
    ( on b178 b674 )
    ( on b930 b178 )
    ( on b954 b930 )
    ( on b16 b954 )
    ( on b140 b16 )
    ( on b74 b140 )
    ( on b214 b74 )
    ( on b111 b214 )
    ( on b719 b111 )
    ( on b103 b719 )
    ( on b600 b103 )
    ( on b959 b600 )
    ( on b824 b959 )
    ( on b188 b824 )
    ( on b453 b188 )
    ( on b256 b453 )
    ( on b75 b256 )
    ( clear b75 )
  )
  ( :goal
    ( and
      ( clear b307 )
    )
  )
)
