( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b541 - block
    b718 - block
    b620 - block
    b964 - block
    b902 - block
    b469 - block
    b28 - block
    b97 - block
    b79 - block
    b280 - block
    b912 - block
    b195 - block
    b215 - block
    b354 - block
    b249 - block
    b860 - block
    b3 - block
    b161 - block
    b895 - block
    b500 - block
    b512 - block
    b476 - block
    b223 - block
    b810 - block
    b174 - block
    b726 - block
    b884 - block
    b525 - block
    b86 - block
    b738 - block
    b725 - block
    b938 - block
    b689 - block
    b347 - block
    b274 - block
    b256 - block
    b769 - block
    b517 - block
    b587 - block
    b770 - block
    b46 - block
    b700 - block
    b300 - block
    b202 - block
    b518 - block
    b839 - block
    b468 - block
    b241 - block
    b102 - block
    b142 - block
    b908 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b541 )
    ( on b718 b541 )
    ( on b620 b718 )
    ( on b964 b620 )
    ( on b902 b964 )
    ( on b469 b902 )
    ( on b28 b469 )
    ( on b97 b28 )
    ( on b79 b97 )
    ( on b280 b79 )
    ( on b912 b280 )
    ( on b195 b912 )
    ( on b215 b195 )
    ( on b354 b215 )
    ( on b249 b354 )
    ( on b860 b249 )
    ( on b3 b860 )
    ( on b161 b3 )
    ( on b895 b161 )
    ( on b500 b895 )
    ( on b512 b500 )
    ( on b476 b512 )
    ( on b223 b476 )
    ( on b810 b223 )
    ( on b174 b810 )
    ( on b726 b174 )
    ( on b884 b726 )
    ( on b525 b884 )
    ( on b86 b525 )
    ( on b738 b86 )
    ( on b725 b738 )
    ( on b938 b725 )
    ( on b689 b938 )
    ( on b347 b689 )
    ( on b274 b347 )
    ( on b256 b274 )
    ( on b769 b256 )
    ( on b517 b769 )
    ( on b587 b517 )
    ( on b770 b587 )
    ( on b46 b770 )
    ( on b700 b46 )
    ( on b300 b700 )
    ( on b202 b300 )
    ( on b518 b202 )
    ( on b839 b518 )
    ( on b468 b839 )
    ( on b241 b468 )
    ( on b102 b241 )
    ( on b142 b102 )
    ( on b908 b142 )
    ( clear b908 )
  )
  ( :tasks
    ( Make-50Pile b718 b620 b964 b902 b469 b28 b97 b79 b280 b912 b195 b215 b354 b249 b860 b3 b161 b895 b500 b512 b476 b223 b810 b174 b726 b884 b525 b86 b738 b725 b938 b689 b347 b274 b256 b769 b517 b587 b770 b46 b700 b300 b202 b518 b839 b468 b241 b102 b142 b908 )
  )
)
