( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b71 - block
    b291 - block
    b802 - block
    b299 - block
    b531 - block
    b271 - block
    b762 - block
    b603 - block
    b682 - block
    b779 - block
    b16 - block
    b983 - block
    b631 - block
    b931 - block
    b864 - block
    b375 - block
    b994 - block
    b182 - block
    b428 - block
    b421 - block
    b47 - block
    b369 - block
    b195 - block
    b720 - block
    b337 - block
    b136 - block
    b168 - block
    b596 - block
    b341 - block
    b660 - block
    b912 - block
    b237 - block
    b143 - block
    b706 - block
    b274 - block
    b68 - block
    b824 - block
    b888 - block
    b700 - block
    b502 - block
    b836 - block
    b288 - block
    b303 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b71 )
    ( on b291 b71 )
    ( on b802 b291 )
    ( on b299 b802 )
    ( on b531 b299 )
    ( on b271 b531 )
    ( on b762 b271 )
    ( on b603 b762 )
    ( on b682 b603 )
    ( on b779 b682 )
    ( on b16 b779 )
    ( on b983 b16 )
    ( on b631 b983 )
    ( on b931 b631 )
    ( on b864 b931 )
    ( on b375 b864 )
    ( on b994 b375 )
    ( on b182 b994 )
    ( on b428 b182 )
    ( on b421 b428 )
    ( on b47 b421 )
    ( on b369 b47 )
    ( on b195 b369 )
    ( on b720 b195 )
    ( on b337 b720 )
    ( on b136 b337 )
    ( on b168 b136 )
    ( on b596 b168 )
    ( on b341 b596 )
    ( on b660 b341 )
    ( on b912 b660 )
    ( on b237 b912 )
    ( on b143 b237 )
    ( on b706 b143 )
    ( on b274 b706 )
    ( on b68 b274 )
    ( on b824 b68 )
    ( on b888 b824 )
    ( on b700 b888 )
    ( on b502 b700 )
    ( on b836 b502 )
    ( on b288 b836 )
    ( on b303 b288 )
    ( clear b303 )
  )
  ( :goal
    ( and
      ( clear b71 )
    )
  )
)
