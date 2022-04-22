( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b882 - block
    b839 - block
    b928 - block
    b144 - block
    b459 - block
    b244 - block
    b281 - block
    b488 - block
    b35 - block
    b454 - block
    b930 - block
    b259 - block
    b279 - block
    b376 - block
    b257 - block
    b627 - block
    b754 - block
    b288 - block
    b13 - block
    b468 - block
    b608 - block
    b997 - block
    b93 - block
    b431 - block
    b154 - block
    b908 - block
    b684 - block
    b751 - block
    b129 - block
    b306 - block
    b484 - block
    b378 - block
    b469 - block
    b980 - block
    b284 - block
    b136 - block
    b474 - block
    b977 - block
    b238 - block
    b743 - block
    b584 - block
    b92 - block
    b809 - block
    b152 - block
    b642 - block
    b143 - block
    b200 - block
    b307 - block
    b720 - block
    b594 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b882 )
    ( on b839 b882 )
    ( on b928 b839 )
    ( on b144 b928 )
    ( on b459 b144 )
    ( on b244 b459 )
    ( on b281 b244 )
    ( on b488 b281 )
    ( on b35 b488 )
    ( on b454 b35 )
    ( on b930 b454 )
    ( on b259 b930 )
    ( on b279 b259 )
    ( on b376 b279 )
    ( on b257 b376 )
    ( on b627 b257 )
    ( on b754 b627 )
    ( on b288 b754 )
    ( on b13 b288 )
    ( on b468 b13 )
    ( on b608 b468 )
    ( on b997 b608 )
    ( on b93 b997 )
    ( on b431 b93 )
    ( on b154 b431 )
    ( on b908 b154 )
    ( on b684 b908 )
    ( on b751 b684 )
    ( on b129 b751 )
    ( on b306 b129 )
    ( on b484 b306 )
    ( on b378 b484 )
    ( on b469 b378 )
    ( on b980 b469 )
    ( on b284 b980 )
    ( on b136 b284 )
    ( on b474 b136 )
    ( on b977 b474 )
    ( on b238 b977 )
    ( on b743 b238 )
    ( on b584 b743 )
    ( on b92 b584 )
    ( on b809 b92 )
    ( on b152 b809 )
    ( on b642 b152 )
    ( on b143 b642 )
    ( on b200 b143 )
    ( on b307 b200 )
    ( on b720 b307 )
    ( on b594 b720 )
    ( clear b594 )
  )
  ( :goal
    ( and
      ( clear b882 )
    )
  )
)
