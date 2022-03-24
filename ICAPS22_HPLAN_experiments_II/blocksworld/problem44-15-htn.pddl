( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b171 - block
    b515 - block
    b178 - block
    b376 - block
    b335 - block
    b846 - block
    b228 - block
    b954 - block
    b273 - block
    b828 - block
    b73 - block
    b972 - block
    b987 - block
    b865 - block
    b389 - block
    b580 - block
    b969 - block
    b765 - block
    b11 - block
    b713 - block
    b1 - block
    b83 - block
    b525 - block
    b583 - block
    b976 - block
    b217 - block
    b603 - block
    b473 - block
    b104 - block
    b358 - block
    b364 - block
    b450 - block
    b32 - block
    b757 - block
    b573 - block
    b758 - block
    b77 - block
    b507 - block
    b714 - block
    b133 - block
    b980 - block
    b857 - block
    b157 - block
    b394 - block
    b8 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b171 )
    ( on b515 b171 )
    ( on b178 b515 )
    ( on b376 b178 )
    ( on b335 b376 )
    ( on b846 b335 )
    ( on b228 b846 )
    ( on b954 b228 )
    ( on b273 b954 )
    ( on b828 b273 )
    ( on b73 b828 )
    ( on b972 b73 )
    ( on b987 b972 )
    ( on b865 b987 )
    ( on b389 b865 )
    ( on b580 b389 )
    ( on b969 b580 )
    ( on b765 b969 )
    ( on b11 b765 )
    ( on b713 b11 )
    ( on b1 b713 )
    ( on b83 b1 )
    ( on b525 b83 )
    ( on b583 b525 )
    ( on b976 b583 )
    ( on b217 b976 )
    ( on b603 b217 )
    ( on b473 b603 )
    ( on b104 b473 )
    ( on b358 b104 )
    ( on b364 b358 )
    ( on b450 b364 )
    ( on b32 b450 )
    ( on b757 b32 )
    ( on b573 b757 )
    ( on b758 b573 )
    ( on b77 b758 )
    ( on b507 b77 )
    ( on b714 b507 )
    ( on b133 b714 )
    ( on b980 b133 )
    ( on b857 b980 )
    ( on b157 b857 )
    ( on b394 b157 )
    ( on b8 b394 )
    ( clear b8 )
  )
  ( :tasks
    ( Make-44Pile b515 b178 b376 b335 b846 b228 b954 b273 b828 b73 b972 b987 b865 b389 b580 b969 b765 b11 b713 b1 b83 b525 b583 b976 b217 b603 b473 b104 b358 b364 b450 b32 b757 b573 b758 b77 b507 b714 b133 b980 b857 b157 b394 b8 )
  )
)
