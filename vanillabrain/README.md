# 바닐라브레인 Redmine을 위한 쉘 스크립트

## 적용 순서

encryption-netrc.sh -> init-git-repo.sh -> update-git-repo.sh (crontab 등록)


1. encryption-netrc.sh

.netrc 파일을 활용하여 gpg 암호화를 수행하는 쉘스크립트

.netrc 파일은 아래와 같은 포맷으로 되어있어야한다.

```.txt
machine github.com
login dailyworker
password {SINSUUNG_GITHUB_ACCESS_TOCKEN}
protocol https

machine gitlab.com
login sinsuung
password {SINSUUNG_GITLAB_ACCESS_TOCKEN}
protocol https
```

여기서 액세스 토큰은 github와 gitlab에서 발급할 수 있으며, fetch를 위해서 사용될 암호화 파일이므로 권한은 repository read 옵션만 주면 된다. 
이런 .netrc 파일을 토대로 .netrc.gpg 암호화 파일이 생성된다.

2. init-git-repo.sh

초기 git repository를 `clone` 하는 명령어를 수행
추가할 프로젝트가 필요하다면 `.vanilla-brain-projects` 에 url을 추가하면 된다.

`clone` 되는 디렉토리는 `/home/vanilla/vanilla-brain-origin-repo`이다.

3. update-git-repo.sh

주기적으로 crontab을 통하여 fetch를 해오는 쉘스크립트

crontab 예시

```.sh
# 매 15분 마다 fetch를 해옴
*/15 * * * * /home/vanilla/redmine/docker-redmine/update-git-repo.sh >> ~/cron.log 2>&1
```

주의 사항으로 `git config --global credential.helper /usr/local/bin/git-credential-netrc` 명령어를 적용시켜야 정상적으로 동작함.
이 부분은 추가로 shell script에 등록해놓을 예정
