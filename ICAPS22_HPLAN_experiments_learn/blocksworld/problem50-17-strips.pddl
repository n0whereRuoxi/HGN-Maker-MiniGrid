( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b829 - block
    b214 - block
    b470 - block
    b633 - block
    b803 - block
    b724 - block
    b517 - block
    b814 - block
    b285 - block
    b895 - block
    b938 - block
    b406 - block
    b376 - block
    b684 - block
    b26 - block
    b43 - block
    b554 - block
    b856 - block
    b769 - block
    b139 - block
    b363 - block
    b819 - block
    b431 - block
    b415 - block
    b745 - block
    b450 - block
    b783 - block
    b174 - block
    b327 - block
    b649 - block
    b373 - block
    b321 - block
    b841 - block
    b91 - block
    b136 - block
    b704 - block
    b435 - block
    b121 - block
    b46 - block
    b460 - block
    b425 - block
    b188 - block
    b525 - block
    b887 - block
    b335 - block
    b403 - block
    b120 - block
    b555 - block
    b368 - block
    b27 - block
    b222 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b829 )
    ( on b214 b829 )
    ( on b470 b214 )
    ( on b633 b470 )
    ( on b803 b633 )
    ( on b724 b803 )
    ( on b517 b724 )
    ( on b814 b517 )
    ( on b285 b814 )
    ( on b895 b285 )
    ( on b938 b895 )
    ( on b406 b938 )
    ( on b376 b406 )
    ( on b684 b376 )
    ( on b26 b684 )
    ( on b43 b26 )
    ( on b554 b43 )
    ( on b856 b554 )
    ( on b769 b856 )
    ( on b139 b769 )
    ( on b363 b139 )
    ( on b819 b363 )
    ( on b431 b819 )
    ( on b415 b431 )
    ( on b745 b415 )
    ( on b450 b745 )
    ( on b783 b450 )
    ( on b174 b783 )
    ( on b327 b174 )
    ( on b649 b327 )
    ( on b373 b649 )
    ( on b321 b373 )
    ( on b841 b321 )
    ( on b91 b841 )
    ( on b136 b91 )
    ( on b704 b136 )
    ( on b435 b704 )
    ( on b121 b435 )
    ( on b46 b121 )
    ( on b460 b46 )
    ( on b425 b460 )
    ( on b188 b425 )
    ( on b525 b188 )
    ( on b887 b525 )
    ( on b335 b887 )
    ( on b403 b335 )
    ( on b120 b403 )
    ( on b555 b120 )
    ( on b368 b555 )
    ( on b27 b368 )
    ( on b222 b27 )
    ( clear b222 )
  )
  ( :goal
    ( and
      ( clear b829 )
    )
  )
)
