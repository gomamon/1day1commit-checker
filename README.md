# 1day1commit-checker
github action을 사용한 1일1커밋 체커! 매일매일 ISSUE를 자동으로 만들어 줍니다.

1일1알고리즘풀기!와 같은 용도의 repository에 사용할 수 있죠!

<img width="374" alt="스크린샷 2021-03-04 오후 9 20 43" src="https://user-images.githubusercontent.com/17876542/109963162-6e284580-7d2f-11eb-81f2-0d2b25bc23b7.png">


## HOW TO USE!
### 1. `.github/createIssueTemplate.sh`에서 parameter 수정하기
`assignees`, `success_title`,`success_label`,`success_contents`,  `fail_title`,`fail_label`,`fail_contents` 수정해주세요!

(ex)
```
commit=$(git show -s --format=%ci | cut -c 1-10)
current=$(date +%F)

assignees="gomamon"

success_title="$current :)"
success_label="o"
success_contents="success!"

fail_title="$current :("
fail_label="x"
fail_contents="fail!"

...

```

### 2. `.github/workflows/1day1commit_checker.yml`에 `Action Secrets`를 추가해주세요!
https://docs.github.com/en/actions/reference/encrypted-secrets

`.github/workflows/1day1commit_checker.yml`파일 마지막 줄 GITHUB_TOKEN에 `Action Secrets`을 추가해주세요!

(ex)
```
...
      - uses: JasonEtco/create-an-issue@v2
        env:
          GITHUB_TOKEN: ${{ secrets.MY_GITHUB_TOKEN }}
```
