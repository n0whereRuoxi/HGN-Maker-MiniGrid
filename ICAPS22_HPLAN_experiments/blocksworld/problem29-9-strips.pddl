( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b732 - block
    b127 - block
    b789 - block
    b849 - block
    b171 - block
    b889 - block
    b517 - block
    b836 - block
    b338 - block
    b88 - block
    b465 - block
    b746 - block
    b430 - block
    b936 - block
    b908 - block
    b431 - block
    b900 - block
    b274 - block
    b534 - block
    b215 - block
    b156 - block
    b42 - block
    b390 - block
    b922 - block
    b38 - block
    b616 - block
    b182 - block
    b64 - block
    b443 - block
    b930 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b732 )
    ( on b127 b732 )
    ( on b789 b127 )
    ( on b849 b789 )
    ( on b171 b849 )
    ( on b889 b171 )
    ( on b517 b889 )
    ( on b836 b517 )
    ( on b338 b836 )
    ( on b88 b338 )
    ( on b465 b88 )
    ( on b746 b465 )
    ( on b430 b746 )
    ( on b936 b430 )
    ( on b908 b936 )
    ( on b431 b908 )
    ( on b900 b431 )
    ( on b274 b900 )
    ( on b534 b274 )
    ( on b215 b534 )
    ( on b156 b215 )
    ( on b42 b156 )
    ( on b390 b42 )
    ( on b922 b390 )
    ( on b38 b922 )
    ( on b616 b38 )
    ( on b182 b616 )
    ( on b64 b182 )
    ( on b443 b64 )
    ( on b930 b443 )
    ( clear b930 )
  )
  ( :goal
    ( and
      ( clear b732 )
    )
  )
)
